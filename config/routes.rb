Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount ActionCable.server => '/cable'
  root "search_queries#index"
  resources :search_queries, only: [:index] do
    get :analytics, on: :collection
  end
end
