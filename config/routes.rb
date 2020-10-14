Rails.application.routes.draw do

  get '/signup', to: 'users#new'


  resources :boards do 

    resources :bulletins, only: [:show, :index, :new, :edit] 
    
  end 
  
  resources :bulletins
  
  resources :boards   






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
