Rails.application.routes.draw do
  resources :todos
  root "todos#index"
end
