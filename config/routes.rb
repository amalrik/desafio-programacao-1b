Rails.application.routes.draw do
  resources :batches, only: [:index, :show, :new, :create]
  root 'batches#index'
end
