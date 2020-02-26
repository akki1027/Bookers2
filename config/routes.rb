Rails.application.routes.draw do
  get 'top' => 'homes#top'
  root "homes#top"
  devise_for :users
  resources :books
  resources :users
  resources :post_images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # sign-inした際にindex画面に移動する
  root 'books#index'
end
