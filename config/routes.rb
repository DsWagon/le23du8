Rails.application.routes.draw do
  authenticated :user, ->(user) { user.vip? } do
    get "vip", to: "pages#vip"
    resources :quotes
    resources :meetings do
      resources :comments, only: [:new, :create]
    end

    resources :flats, only: [:edit, :update] do
    end
  end

  authenticated :user, ->(user) { user.admin? } do
    get "admin", to: "pages#admin"
    resources :quotes
    resources :meetings do
      resources :comments, only: [:new, :create]
    end

    resources :flats, only: [:edit, :update] do
    end
  end


  devise_for :users
  root to: "pages#home"
  get "about", to: "pages#about"
  get "profile", to: "pages#profile"

  resources :meetings, only: [:index, :show] do
    resources :comments, only: [:new, :create]
  end

  resources :flats, only: [:edit, :update] do
  end
  resources :quotes, only: [:index, :show] do
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
