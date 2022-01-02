Rails.application.routes.draw do
  resources :reserves
  resources :books
  resources :recommends
  resources :contacts
  resources :blogs
  resources :information
  resources :services
  resources :hotel_intros
  resources :abouts
  resources :mains
  resources :enrollments
  devise_for :users
  resources :rooms do 
    resources :reserves, only: [:new, :create]
  end
  resources :users, only: [:index, :edit, :show, :update]
  get 'home/index'
  get 'home/activity'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
