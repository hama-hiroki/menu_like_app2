Rails.application.routes.draw do
  root 'menus#index'
  devise_for :users
  resources :menus do
    resources :likes, only: [:create, :destroy]
  end
  get '/admin', to: 'menus#admin'

   resources :menus do
    member do
      post 'like'
    end
  end
end