Rails.application.routes.draw do
  devise_for :users
  get '/' => 'home#top'
  get 'about' => 'home#about'
  get 'how_to' => 'home#how_to'

  # resources :users,:only => [:update, :edit, :create, :show]
  # get 'signup' => 'users#new'
  # get 'users' => 'users#new'
  # get 'login' => 'users#login_form'
  # post 'login' => 'users#login'
  # post 'logout' => 'users#logout'
  # get 'users/:id/likes' => 'users#likes'
  # get 'users/:id/wants' => 'users#wants'

  post "wants/:item_id/create" => "wants#create"
  post "wants/:item_id/destroy" => "wants#destroy"
  
  post "likes/:item_id/create" => "likes#create"
  post "likes/:item_id/destroy" => "likes#destroy"
    
  get 'items/index' => 'items#index'
  get 'items/search_results' => 'items#search_results'
  resources :items, :except =>[:index] do
    resources :images
    resources :comments, only: [:create, :destroy]
  end
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
