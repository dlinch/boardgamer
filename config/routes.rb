Rails.application.routes.draw do
  root to: 'welcome#home'

  resources :users
  resources :games
end
