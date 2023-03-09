Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :families, only: %i[index new create show] do
    resources :pets, only: %i[new create]
  end

  resources :pets, only: %i[destroy edit update] do
    resources :tasks, only: %i[new create]
  end

  resources :tasks, only: %i[index destroy edit update] do
    resources :schedules, only: %i[create]
  end
end
