Rails.application.routes.draw do
  get 'categories/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users
  root "articles#index"
  resources :users, only: [:show]
  resources :articles do
    resources :comments
    resources :likes
  end

  resources :categories, only: [:show]
  get 'admin/dashboard', to: 'admin#dashboard', as: 'admin_dashboard'
  
end