Rails.application.routes.draw do
  resources :logs
  resources :activities
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get 'users/:id/activities', to: 'users#retrieve_user_activities'
      post 'users/:id/log_activity', to: 'users#log_activity'
    end
  end
end
