Rails.application.routes.draw do
  resources :categories
  root 'html_pages#home'

  get '/help', to: 'html_pages#help'
  get '/about', to: 'html_pages#about'
  get '/contact', to: 'html_pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users 
  resources :debits

  get '/users/:id/home', to: 'users#home', as: "home"

end
