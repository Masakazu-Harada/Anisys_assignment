Rails.application.routes.draw do
  root 'home#top'
  
  namespace :admin do
    references :employees
  end
  
end
