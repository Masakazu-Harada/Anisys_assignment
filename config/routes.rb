Rails.application.routes.draw do

  namespace :admin do
    resources :employees
  end

  root to: 'home#top'
end
