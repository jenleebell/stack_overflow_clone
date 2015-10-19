Rails.application.routes.draw do
  root to: 'posts#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :posts do
    resources :comments
  end
  resources :users
  resources :sessions
end
