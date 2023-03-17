Rails.application.routes.draw do
  get 'notifications/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#show"

  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :families, only: %i[index new create show] do
    resources :pets, only: %i[new create]
  end

  # Family join
  post "families/join", to: 'families#create_join', as: :families_join

  resources :pets, only: %i[show destroy edit update]

  resource :profiles, only: %i[show update]

  resources :tasks do
    resources :schedule_exceptions
  end

  resources :documents
  resources :notifications

  resources :species, only: [] do
    resources :breeds, only: :index, on: :collection
  end
end
