Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
  authenticated :user do
    root :to => 'diaries#index', as: :authenticated_root
  end
  unauthenticated :user do
    root :to => 'diaries#top', as: :unauthenticated_root
  end
end

  resources :users
  resources :diaries do
    resources :comments, only:[:create,:index]
  end

  resources :tags, only:[:new,:create,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
