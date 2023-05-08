Rails.application.routes.draw do
  resources :directors
  resources :direcctors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"'
  root "dashboards#index"
end
