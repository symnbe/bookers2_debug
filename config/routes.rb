Rails.application.routes.draw do
  get 'relationships/followings/:user_id' => 'relationships#followings',as: 'followings'
  get 'relationships/followers/:user_id' => 'relationships#followers', as: 'followers'
  devise_for :users
  root to: "homes#top"
  get "home/about"=>"homes#about"
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    # get 'followings' => 'relationships#followings', as: 'followings'
    # get 'followers' => 'relationships#followers', as: 'followers'
  end
end
