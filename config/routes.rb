Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "ideas#index"
  resources :ideas

  resources :users, only: [:new, :create, :show, :edit, :update]
end
