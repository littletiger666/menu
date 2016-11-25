Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'session#create'

  get 'session/destroy'

  resources :users
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
