Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user do
    authenticated :user do
      root to: 'pages#home', as: :authenticated_root
    end
    unauthenticated :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
      # get 'users/sign_in', to: "devise/sessions#new", as: :unauthenticated_root
    end
  end
  # il faut juste améliorer 'users/sign_in view and refocalisant, controllant les verts etc'

  get '/admin', to: 'pages#admin', as: 'admin'

  mount ActionCable.server => "/cable"


  resources :categories, only: [:create]

  resources :team_memberships, only: [:index, :destroy]

  resources :publications, only: [:destroy]

  resources :companies , only: [:create, :update, :show] do
    resources :company_passages, only: [:create, :destroy], as: :companypassages
    resources :team_memberships, only: [:create]
    resources :publications, only: [:create]
  end

  resources :founder_conversations, only: [:update]

  resources :founder_conversations, only: [:index] do
    resources :messages, only: [:create]
  end

  resources :founder_conversations, only: [:show] do
    resources :messages, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
