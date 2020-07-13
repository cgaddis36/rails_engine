Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/merchants', to: 'merchants#index'
      get '/merchants/:id', to: 'merchants#show'
      post '/merchants', to: 'merchants#create', param: 'name'
      patch '/merchants/:id', to: 'merchants#update', param: 'name'
      delete '/merchants/:id', to: 'merchants#destroy'
      namespace :merchants do
        get '/:id/items', to: 'search#show'
      end
      get '/items', to: 'items#index'
      get '/items/:id', to: 'items#show'
      post '/items', to: 'items#create', param: 'name'
      patch '/items/:id', to: 'items#update', param: 'name'
      delete '/items/:id', to: 'items#destroy'
      namespace :items do
        get '/:id/merchant', to: 'search#show'
      end
    end
  end
end
