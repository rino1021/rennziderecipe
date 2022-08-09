Rails.application.routes.draw do

  devise_for :users
  root :to => 'homes#top'
  resources :post_images, only: [:new, :index, :show,:edit, :update,:create,:destroy] do
    resource :favorites, only:[:create,:destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only:[:show,:edit,:update]
  get 'search' => 'searches#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
