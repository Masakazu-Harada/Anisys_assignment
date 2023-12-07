Rails.application.routes.draw do
  root to: 'home#top'
  get  '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :employees
  end

  resources :work_schedules do
    collection do
      post :import
    end
  end
end
