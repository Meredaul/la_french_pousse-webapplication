Rails.application.routes.draw do
  resources :categories
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user do
    authenticated :user do
      root to: 'pages#home', as: :authenticated_root
    end
    unauthenticated :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end

  resources :companies do
    resources :company_passages, only: [:create, :destroy], as: :companypassages
  end

  resources :chat_rooms, only: [:show] do
    resources :messages, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
