Rails.application.routes.draw do
  root to: "homes#top"
  get 'home/about' => 'homes#about'
  get 'post/ranks' => 'posts#ranks'
  devise_for :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    get 'favorites' => 'favorites#favorites'
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

end
