Rails.application.routes.draw do
  get 'chats/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
    devise_for :users
  get "/home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:index, :create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get "search" => "searches#search"

  get 'chat/:id', to: 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  resources :groups, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
    get "join" => "groups#join"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
