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
      get 'users/:id/weekly_activities', to: 'users#retrieve_weekly_activities'
      get 'users/:id/weekly_tally', to: 'users#retrieve_weekly_tally'
    end
  end
end
