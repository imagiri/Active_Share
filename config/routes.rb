Rails.application.routes.draw do
  devise_for :users
  resources :users
  if user_signed_in?
  root to: "diarys#index"
  else
  root to: "diarys#top"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
