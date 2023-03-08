Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "home/about"=>"homes#about"
  get 'relationships/followings/:user_id' => 'relationships#followings',as: 'followings'
  get 'relationships/followers/:user_id' => 'relationships#followers', as: 'followers'
  get 'search' => "searches#search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
  end


end
