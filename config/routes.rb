Rails.application.routes.draw do
  get 'top' => 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  root "homes#top"

  devise_for :users
  resources :follows, only: [:create, :destroy]
  resources :books do
  	resource :post_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :users do
    get '/follow_list' => 'users#follow_list', as: 'follow_list'
    get '/follower_list' => 'users#follower_list', as: 'follower_list'
  end
  resources :post_images
  resources :homes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
