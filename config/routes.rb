Rails.application.routes.draw do
  resources :todos, controller: :todos do
    collection do
      post :batch
    end
  end
  root "todos#index"
end
