Rails.application.routes.draw do
  resources :books do
    member do
      get :delete
    end
  end
  # added a delete route

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
