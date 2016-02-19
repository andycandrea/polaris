Rails.application.routes.draw do
  root to: 'static_pages#home'

  devise_for :users

  resources :image_sets
  resources :color_images
end
