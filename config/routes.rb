Rails.application.routes.draw do
  get 'search', to: 'search#index'
  resources :posts do
    resources :commentaries
  end

  authenticated :user, ->(user) { user.admin? } do
    mount Motor::Admin => '/admin'
    get "admin", to: "pages#admin"
    resources :meetings do
    end
    resources :flats, only: [:new, :create, :edit, :update] do
    end
    resources :quotes
  end

  authenticated :user, ->(user) { user.vip? } do
    get "vip", to: "pages#vip"
    resources :meetings do
    end
    resources :flats, only: [:new, :create, :edit, :update] do
    end
    resources :quotes
  end

  devise_for :users
  root to: "pages#home"
  get 'search', to: 'search#index'
  get "profile", to: "pages#profile"
  get "legal", to: "pages#legal"
  resources :meetings, only: [:index, :show] do
  end
  resources :flats, only: [:new, :create, :edit, :update] do
  end
  resources :quotes, only: [:index, :show] do
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
