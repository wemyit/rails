Rails.application.routes.draw do
  namespace :api do
    resources :results, only: [:index, :create, :show]
    resources :questions, only: [:index]
  end

  root 'home#index'
end
