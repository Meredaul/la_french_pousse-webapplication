Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get ‘auth/:provider/callback’, to: ‘sessions#googleAuth’
  get ‘auth/failure’, to: redirect(‘/’)
end
