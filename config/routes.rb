Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: "reviews#index"

  resources :reviews
  devise_for :users
end
