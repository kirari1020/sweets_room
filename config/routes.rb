Rails.application.routes.draw do
  root to: "homes#top"
  get 'home/about' => 'homes#about'
  get 'post/ranks' => 'posts#ranks'
  get 'search' => 'searches#search'
  devise_for :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get 'favorites' => 'favorites#favorites'
  end

end
