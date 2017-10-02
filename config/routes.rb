Rails.application.routes.draw do
  resources :doctors
  resources :patients do
    resources :appointments
  end

  root to: 'patients#index'
end
