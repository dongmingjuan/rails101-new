Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users
  resources :groups do
    member do
      post :join
      post :quit
    end

    resources :posts
  end

namespace :account do
  resources :groups
  resources :posts
end

namespace :admin do
  resources :groups do
    member do
      post :publish
      post :hide
    end
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
