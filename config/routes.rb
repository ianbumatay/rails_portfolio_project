Rails.application.routes.draw do 

  resources :users, only: [:create, :show, :edit, :update]

  get '/signup', to: 'users#new' 

  #post '/signup', to: 'users#create'


  resources :boards do 

    resources :bulletins, only: [:show, :index, :new, :edit] 
    
  end 
  
  resources :bulletins
  
  resources :boards   






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
