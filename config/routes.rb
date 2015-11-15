Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'users#new'
  
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

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
