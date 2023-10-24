Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    root 'sessions#new'
  end
  resources :products do
      collection do
        get :categories
      end
  end
  resources :product_categories
  resources :product_types
  resources :users
  get "audit_trails", to: "audit_trails#index"
end
