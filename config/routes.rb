Rails.application.routes.draw do
  resources :users
  
  root 'users#root'
  
  # Static Pages Routes
  get 'home' => 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'news' => 'static_pages#news'

  # Users Routes
  get 'signup' => 'users#new'
end
