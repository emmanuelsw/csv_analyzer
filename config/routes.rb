Rails.application.routes.draw do
  root 'movies#index'
  post 'analyze', to: 'movies#analyze'
end
