Rails.application.routes.draw do
  root to: 'pages#home'  #defines which method controlls the homepage
  get 'about', to: 'pages#about'
end
