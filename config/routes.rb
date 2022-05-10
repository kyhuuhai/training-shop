Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/contact", to: "static_pages#contact"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/show", to: "users#show"
    get "/signup", to: "users#new"

    resources :products
    resources :users
    resources :orders
    resources :rooms

    namespace :admin do
      resources :categories
      resources :products
      resources :users
      get "/profit", to: "charts#profit"
    end

    resources :account_activations, only: %i(edit)
    resources :password_resets, only: %i(new create edit update)
    resources :carts, only: %i(index) do
      collection do
        post "add_to_cart/:id", to: "carts#add_to_cart", as: "add_to"
        delete "remove_from_cart/:id", to: "carts#remove_from_cart", as: "remove_from"
        post "update_cart", to: "carts#update_cart", as: "update_to"
      end
    end
    resources :account_activations, only: [:edit]
    resources :password_resets, only: [:new, :create, :edit, :update]
  end
end
