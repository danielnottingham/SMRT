# frozen_string_literal: true

Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :talks do
    collection do
      post :import
    end
  end
  root "talks#index"
end
