Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
  authenticated :user do
    root :to => 'diarys#index', as: :authenticated_root
  end
  unauthenticated :user do
    root :to => 'diarys#top', as: :unauthenticated_root
  end
end

  resources :users
  resources :diarys

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
