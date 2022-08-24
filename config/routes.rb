Rails.application.routes.draw do

   devise_for :admins, controllers: {sessions: 'admins/sessions'}
   namespace :admins do
   get "/home/top" => "homes#top"
      resources :post_images, only: [:new, :index, :show,:edit, :update,:create,:destroy] do
       resources :post_comments, only: [:index, :create, :destroy]
      end
   resources :users, only:[:show,:index,:edit,:update]

   end

  devise_for :users, controllers: {registrations: 'users/registrations'}
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  #scope module: :users do
  #namespace :users do
  root :to => 'homes#top'
  #get "/home/top" => "homes#top"
  resources :post_images, only: [:new, :index, :show,:edit, :update,:create,:destroy] do
    resource :favorites, only:[:create,:destroy]
    resources :post_comments, only: [:create, :destroy]
    get :ranks
  end
  resources :users, only:[:show,:index,:edit,:update,:destroy] do
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
#end
