Rails.application.routes.draw do
 

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  post '/signout' => 'sessions#destroy'


  resources :users

  root 'welcome#index'
end
