Rails.application.routes.draw do
  root to: 'home#index'
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :exercises, only: [:index, :show, :create, :update, :destroy]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
