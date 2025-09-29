Rails.application.routes.draw do
  resources :posts
  get "profile/show"
  devise_for :users

  authenticated :user do
    root to: "profile#show", as: :authenticated_root
  end

  # Для гостей используем devise_scope
  devise_scope :user do
    root to: "devise/sessions#new", as: :unauthenticated_root
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
