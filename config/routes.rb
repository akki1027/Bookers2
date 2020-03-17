Rails.application.routes.draw do
  get 'top' => 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  root "homes#top"
  devise_for :users
  resources :books do
  	resource :post_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :users
  resources :post_images
  resources :homes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
