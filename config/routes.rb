Rails.application.routes.draw do
  root to: 'welcome#home'

  resources :users do
    resources :games, only: [:show, :index], controller: 'users/games'
    resources :plays, controller: 'users/plays'
  end
  resources :games
  resources :plays
end
