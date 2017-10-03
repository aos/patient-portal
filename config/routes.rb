Rails.application.routes.draw do
  scope '/api' do
    resources :patients do
      resources :appointments
    end
  end

end
