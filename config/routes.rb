Rails.application.routes.draw do
  resources :todos, only: [:index, :show, :create, :destroy]
end
