Rails.application.routes.draw do
  get 'top' => 'homes#top'
  get 'about' => 'homes#about'
  root "homes#top"
  devise_for :users
  resources :books
  resources :users
  resources :post_images
  resources :homes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
