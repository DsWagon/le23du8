Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "about", to: "pages#about"
  get "profile", to: "pages#profile"
  
  resources :meetings, only: [:index, :show] do
    resources :comments, only: [:new, :create]
  end

  resources :companies, only: [:new, :create] do
    resources :comments, only: [:new, :create]
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
