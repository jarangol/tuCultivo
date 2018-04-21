Rails.application.routes.draw do
  get 'plague_reports/create'

  resources :grooves
  resources :lots
  resources :farms
  devise_for :users
  root to: "nodes#index"


  resources :nodes do
    resources :sensors
    delete "/sensors/:id", to: "sensors#destroy", as:"delete_sensor"
    post "/sensors", to: "sensors#create", as:"create_sensor"
   
    get '/sensors/:sensor_id/values', to: 'sensors#values', as: 'values'
  end

  post '/sensors/:id/values', to: 'sensors#create_value'
  post '/grooves/:groove_id/reports', to: 'plague_reports#create'
end
