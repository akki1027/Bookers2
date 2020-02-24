Rails.application.routes.draw do
  get 'users/edit'
  get 'users/show'
  devise_for :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # sign-inした際にindex画面に移動する
  root 'books#index'
end
