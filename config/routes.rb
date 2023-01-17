Rails.application.routes.draw do
  # resources :users
  namespace :api do
    namespace :v1 do
      resources :recipes, only: %i[index]
      resources :learning_resources, only: %i[index]
      resources :users, only: [:create] do
        resources :favorites, only: [:index]
      end
    end
  end
end
