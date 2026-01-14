Rails.application.routes.draw do
  resources :quests
  get "/brag" => "brag#index", as: :brag
  get "up" => "rails/health#show", as: :rails_health_check
  root "quests#index"
end
