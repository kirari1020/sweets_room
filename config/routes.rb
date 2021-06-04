Rails.application.routes.draw do
  root to: "homes#top"
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    get 'favorites' => 'favorites#favorites'
    resources :comments, only: [:create, :destroy]
  end

end
