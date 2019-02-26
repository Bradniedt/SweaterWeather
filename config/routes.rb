Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/forecast', to: "forecast#index"
      get '/backgrounds', to: "background#index"
      post '/users', to: "users#create"
      post '/sessions', to: "sessions#create"
      post '/favorites', to: "favorites#create"
      get '/favorites', to: "favorites#index"
      delete '/favorites', to: "favorites#destroy"
      get '/gifs', to: "gifs#index"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
