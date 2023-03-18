require 'api_constraints'

Rails.application.routes.draw do  
  resources :vinculos
  
  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'
    scope module: :v1, 
          constraints: ApiConstraints.new(version: 1, default: true) do
      resources :articles
    end
  end

  namespace :api do
    namespace :v1 do
      get '/addresses/:cep', to: 'addresses#show'
    resources :addresses
    end
  end

  namespace :api do
    namespace :v1 do
      get '/vinculos', to: 'vinculos#show'
        end
  end
end
