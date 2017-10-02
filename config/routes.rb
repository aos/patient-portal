Rails.application.routes.draw do
  scope '/api' do
    resources :doctors
    resources :patients do
      resources :appointments
    end
  end

end
