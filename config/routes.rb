Rails.application.routes.draw do
 



  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  post '/signout' => 'sessions#destroy'
  post '/addresses/new' => 'addresses#create'
  post '/details/new' => 'details#create'
  get '/user/address' => 'users#address' 
  post '/user/address' => 'users#address'

  resources :followups
  resources :details
  resources :addresses 
  resources :users

  root 'welcome#index'
end
