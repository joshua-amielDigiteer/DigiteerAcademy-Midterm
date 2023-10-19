Rails.application.routes.draw do
  get 'product_types/index'
  get 'product_types/new'
  get 'product_types/show'
  get 'product_types/create'
  get 'product_types/edit'
  get 'product_types/update'
  get 'product_types/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
