Rails.application.routes.draw do
  resources :companies
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user do
    authenticated :user do
      root to: 'pages#home', as: :authenticated_root
    end
    unauthenticated :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end


  resources :pousses



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
