Rails.application.routes.draw do 

  resources :users, only: [:new, :create, :show]

  #get '/signup', to: 'users#new', as: 'signup'

  #post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new' 

  post '/login', to: 'sessions#create' 

  delete '/logout', to: 'sessions#destroy' 

  root 'welcome#home'  

  get '/auth/:provider/callback' => 'sessions#omniauth'

  #nested
  resources :boards do 
    resources :bulletins, shallow: true 
  end   
  
  resources :bulletins
  
  resources :boards 
  







  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
