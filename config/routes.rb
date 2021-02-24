Rails.application.routes.draw do
  resources :todos
  root "todos#index"
    mount API::Base, at: "/"

end
