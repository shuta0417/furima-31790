Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
    resources :purchase_records, only: [:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end