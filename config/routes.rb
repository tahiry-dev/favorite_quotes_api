
Rails.application.routes.draw do
  root 'quotes#index'
  
  namespace :api do
    scope :v1 do
      post '/login', to: 'users#login'
      post '/signup', to: 'users#signup'
    end
  end

  resources :quotes do
    put :favorite, on: :member
  end
end