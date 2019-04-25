Rails.application.routes.draw do
  get '/items/index' => 'items#index'
  resources :items, :except =>[:index] do
    resources :images
  end
    
  resources :users,:only => [:update, :edit, :create, :show]
  get 'signup' => 'users#new'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
    
  get '/' => 'home#top'
  get 'about' => 'home#about'
  get 'how_to' => 'home#how_to'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
