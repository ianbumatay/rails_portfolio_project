Rails.application.routes.draw do 

  

  get '/signup', to: 'users#new' 

  post '/signup', to: 'users#create' 

  get '/login', to: 'sessions#new' 

  post '/login', to: 'sessions#create' 

  delete '/logout', to: 'sessions#destroy' 

  root 'welcome#home'

  resources :users, only: [:create, :show, :edit, :update,]

  resources :boards do 

    resources :bulletins, only: [:show, :index, :new, :edit] 
    
  end 
  
  resources :bulletins
  
  resources :boards   






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
