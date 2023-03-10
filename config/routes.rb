Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :families, only: %i[index new create show] do
    resources :pets, only: %i[new create]
  end

  post "families/join", to: 'families#create_join', as: :families_join


  resources :pets, only: %i[destroy edit update]

  resources :tasks

  resources :species, only: [] do
    resources :breeds, only: :index, on: :collection
  end

end
