Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'recipes#index'

  get '/auth/:provider/callback' => 'sessions#create'
end
