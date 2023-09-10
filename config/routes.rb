Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  devise_for :users
  root to: "pages#home"
  get "about", to: "pages#about"
  get "profile", to: "pages#profile"
  get "admin", to: "pages#admin"

  resources :meetings, only: [:index, :show, :new, :create] do
    resources :comments, only: [:new, :create]
  end

  resources :flats, only: [:edit, :update] do
  end
  resources :quotes, only: [:index, :show, :new, :create] do
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
