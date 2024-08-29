Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

#   devise_for :users, controllers: {
#   sessions: 'users/sessions'
# }
#   devise_scope :user do
#     root to: 'devise/sessions#new'
#   end

devise_for :users

devise_scope :user do
  authenticated :user do
    root 'posts#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end

root to: "devise/sessions#new"

resources :posts

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
end
