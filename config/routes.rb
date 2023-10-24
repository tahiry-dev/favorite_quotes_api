
Rails.application.routes.draw do
  namespace :api do
    scope :v1 do
      post '/login', to: 'users#update'
      post '/signup', to: 'users#create'
    end
  end

  resources :quotes 
  
  put '/:id/favorite', to: 'favorites#update'
end