Rails.application.routes.draw do
  namespace :shortner do
    namespace :simple do
      resources :urls, only: [:show, :new, :create]
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  root to: "home#index"
  get "/:slug", to: "home#show", as: :slug_redirect
end
