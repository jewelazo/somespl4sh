Rails.application.routes.draw do
  root "categories#index"
  resources :categories do
    resources :comments
    resources :photos
  end
  
  resources :photos do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
