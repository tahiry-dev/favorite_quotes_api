
Rails.application.routes.draw do
  namespace :api do
    scope :v1 do
      post '/login', to: 'users#login'
      post '/signup', to: 'users#signup'
    end
  end

  resources :quotes 
  
  put '/:id/favorite', to: 'favorites#favorite'
end