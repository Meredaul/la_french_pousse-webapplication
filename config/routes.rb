Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user do
    authenticated :user do
      root to: 'pages#home', as: :authenticated_root
    end
    unauthenticated :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end


  resources :companies, type: "company"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
