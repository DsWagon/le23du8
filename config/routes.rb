Rails.application.routes.draw do
  get 'commentarys/index'
  get 'commentarys/show'
  get 'commentarys/new'
  get 'commentarys/create'
  get 'commentarys/edit'
  get 'commentarys/update'
  get 'commentarys/destroy'
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/create'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'
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
