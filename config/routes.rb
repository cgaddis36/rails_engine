Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/merchants', to: 'merchants#index'
      get '/merchants/:id', to: 'merchants#show'
      post '/merchants', to: 'merchants#create', param: 'name'
      patch '/merchants/:id', to: 'merchants#update', param: 'name'
      delete '/merchants/:id', to: 'merchants#destroy'
    end
  end
end
