Rails.application.routes.draw do
  root "categories#index"
  resources :categories do
    resources :comments
    resources :photos
  end

  resources :photos do
    resources :comments
  end
  
end
