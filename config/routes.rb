Rails.application.routes.draw do
  resources :directors

  scope module: :api do
    resources :media_contents
  end
  
  root "dashboards#index"
end