Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/merchants', to: 'merchants/search#index'
      get '/merchants/:id', to: 'merchants/search#show'
      post '/merchants', to: 'merchants/search#create', param: 'name'
      patch '/merchants/:id', to: 'merchants/search#update', param: 'name'
      delete '/merchants/:id', to: 'merchants/search#destroy'
    end
  end
end
