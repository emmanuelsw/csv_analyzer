Rails.application.routes.draw do
  root 'movies#index'
  get 'results', to: 'movies#results'
  post 'analyze', to: 'movies#analyze'
end
