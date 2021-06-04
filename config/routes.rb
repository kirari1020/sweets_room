Rails.application.routes.draw do
  root to: "homes#top"
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

end
