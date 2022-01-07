Rails.application.routes.draw do
  resources :categories do
    resources :comments
  end
  
  resources :photos do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
