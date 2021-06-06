Rails.application.routes.draw do
  
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
  resources :categories
  # get 'categories', to: 'category#index'
  # get 'categories/new', to: 'category#new'
  # get 'categories/show', to: 'category#show'
  # get 'categories/create', to: 'category#create'
  # get 'categories/edit', to: 'category#edit'
  # get 'categories/update', to: 'category#update'
  # get 'categories/destroy', to: 'category#destroy'

  get '/users/:id/home', to: 'users#home', as: "home"

end
