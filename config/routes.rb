
Rails.application.routes.draw do
  root 'quotes#index'
  
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

  resources :quotes do
    put :favorite, on: :member
  end
end