Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :courses, only: [:index, :show]
      resources :assignments, only: [:index, :show]
      resources :lessons, only: [:index, :show]

      resources :users do
        resources :assignments
        resources :lessons, only: [:index, :show]
        resources :courses, only: [:index, :show]
        post '/assignments/:id/change_status', to: 'assignments#change_status'
      end
      
    end
  end
end
