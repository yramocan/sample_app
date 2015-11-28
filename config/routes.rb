Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'

  # Static Pages Routes
  get 'home' => 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'news' => 'static_pages#news'

  # Users Routes
  get 'signup' => 'users#new'

  # Session Routes
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users, :only => [:index, :create, :new]

  match ":username", :to => "users#show", :as => :user, :via => :get
  match ":username/edit", :to => "users#edit", :as => :edit_user, :via => :get
  match ":username", :to => "users#update", :via => :patch

  # Followers/Following Stats Routes
  match ":username/following", :to => "users#following", :as => :following_user, :via => :get
  match ":username/followers", :to => "users#followers", :as => :followers_user, :via => :get

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
