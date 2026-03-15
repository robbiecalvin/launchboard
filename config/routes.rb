Rails.application.routes.draw do
  root "home#index"

  resources :jobs, only: %i[index show] do
    resources :job_applications, only: :create
  end

  namespace :admin do
    root "dashboard#index"
    resources :companies
    resources :jobs
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
