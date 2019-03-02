Rails.application.routes.draw do
  
  get  'signup' => 'users#new'
  post 'users/create' => 'users#create'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  get 'users/:id' => 'users#show'
    
  get '/' => 'home#top'
  get 'about' => 'home#about'
  get 'how_to' => 'home#how_to'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
