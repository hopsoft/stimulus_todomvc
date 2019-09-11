Rails.application.routes.draw do
  resources :todos do
    collection do
      post :bulk_update
    end
  end
  root "todos#index"
end
