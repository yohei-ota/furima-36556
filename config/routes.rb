Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create] do
      collection do
        get "thank"
      end
    end
  end
end
