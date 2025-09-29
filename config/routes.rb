Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [ :create, :destroy ]
  end

  devise_for :users

  get "/profile/:user_id", to: "profile#show", as: :profile_show

  # Главная страница для авторизованных пользователей
  authenticated :user do
    root to: "posts#index", as: :authenticated_root
  end

  resources :users, only: [ :show ] do
    resources :subscriptions, only: [ :create, :destroy ]
  end


  # Главная страница для гостей
  devise_scope :user do
    root to: "devise/sessions#new", as: :unauthenticated_root
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
