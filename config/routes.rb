Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  namespace :api do 
    namespace :v1 do 

        resources :damages
        resources :invoices
        resources :maintenances
        resources :payments
        resources :rentals
        resources :reservations
        resources :vehicles

    end
  end

  # get '/api-docs' => 'swagger_ui#index' # Esta línea sirve la documentación de Swagger

  # get "up" => "rails/health#show", as: :rails_health_check

  
end
