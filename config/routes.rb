Rails.application.routes.draw do

  devise_for :users
  root :to => 'homes#top'
  resources :post_images, only: [:new, :index, :show,:edit, :update,:create,:destroy] do
    resource :favorites, only:[:create,:destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only:[:show,:edit,:update] do
   member do
      get :favorites
   end
   resource :relationships, only: [:create,:destroy,:show]
  get '/followers'=>'relationships#followers'
  get '/followings'=>'relationships#followings'
  end
  get 'search' => 'searches#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
