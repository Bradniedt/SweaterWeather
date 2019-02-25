Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/forecast', to: "forecast#index"
      get '/backgrounds', to: "background#index"
      post '/users', to: "users#create"
      post '/sessions', to: "sessions#create"
      get '/gifs', to: "gifs#create" 
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
