Rails.application.routes.draw do
  resources :courses, only: [:index, :show]
  resources :assignments, only: [:index, :show]
  resources :lessons, only: [:index, :show]
  resources :users do
    resources :assignments
    resources :lessons, only: [:index, :show]
    resources :courses, only: [:index, :show]
    post '/assignments/:id/change_status', to: 'assignments#change_status'
    # post '/assignments/:id/:user_id/change_status', to: 'assignments#change_status'
  end
end
