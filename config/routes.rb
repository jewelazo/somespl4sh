Rails.application.routes.draw do
  root "categories#index"
  get 'searchform', to: "photos#search_form"
  get 'search', to: "photos#search"
  resources :categories do
    resources :comments
    resources :photos
  end

  resources :photos do
    resources :comments
  end
  
end
