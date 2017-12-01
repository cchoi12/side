Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index'

  resources :events, only: %i[index show edit update]

  resources :movies, only: %i[index show edit update]
end
