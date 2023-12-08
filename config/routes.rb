Rails.application.routes.draw do
  get 'top/index'
  resources :rooms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  root to: 'top#index'
  resources :entries, only: %i[new create destroy index], path: :rentals
  post 'entry/confirm'
end
