Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :exercises, only: [:index, :show, :create]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
