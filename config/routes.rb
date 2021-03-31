Rails.application.routes.draw do
  get 'books/index'
  devise_for :users
  root to: 'books#index'
end
