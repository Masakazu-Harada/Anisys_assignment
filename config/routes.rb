Rails.application.routes.draw do
  get 'sessions/new'

  namespace :admin do
    resources :employees
  end

  root to: 'home#top'
end
