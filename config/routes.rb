Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products do
      collection do
        get :categories
      end
  end
  resources :product_categories
  resources :product_types
end
