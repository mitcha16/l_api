Rails.application.routes.draw do
  resources :courses, only: [:index, :show]
  resources :users
end
