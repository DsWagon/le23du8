Rails.application.routes.draw do

  authenticated :user, ->(user) { user.admin? } do
    mount Motor::Admin => '/admin'
    get "admin", to: "pages#admin"
    resources :quotes
    resources :meetings do
    end
    resources :flats, only: [:new, :create, :edit, :update] do
    end
    resources :posts do
      resources :commentaries
    end
  end

  authenticated :user, ->(user) { user.vip? } do
    get "vip", to: "pages#vip"
    resources :quotes
    resources :meetings
    resources :flats, only: [:new, :create, :edit, :update] do
    end
    resources :posts do
      resources :commentaries
    end
  end

  devise_for :users
  root to: "pages#home"
  get "profile", to: "pages#profile"
  get "legal", to: "pages#legal"
  resources :meetings, only: [:index, :show] do
  end
  resources :flats, only: [:new, :create, :edit, :update] do
  end
  resources :quotes, only: [:index, :show] do
  end
  resources :posts do
    resources :commentaries
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
