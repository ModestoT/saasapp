Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'  #defines which method controlls the homepage
  get 'about', to: 'pages#about'
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
end
