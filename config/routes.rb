Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :courses, only: [:index, :show]
      resources :assignments, only: [:index]
      resources :lessons, only: [:index, :show]
      get '/assignments/complete', to: 'assignments#complete'
      get '/assignments/incomplete', to: 'assignments#incomplete'
      get '/courses/:id/assignments', to: 'courses#assignments'
      get '/users/:id/assignments', to: 'users#assignments'
      get '/lessons/:id/assignments', to: 'lessons#assignments'
      resources :users do
        # resources :assignments #for later functionality
        # resources :lessons, only: [:index, :show]
        # resources :courses, only: [:index, :show]
        # post '/assignments/:id/change_status', to: 'assignments#change_status' for when adding functionality for updating individual user status
      end

    end
  end
end
