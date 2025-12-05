Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Authentication
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'
  
  # Student routes
  root 'dashboard#index'
  get 'dashboard', to: 'dashboard#index'
  get 'question', to: 'questions#show'
  post 'questions/:id/answer', to: 'questions#answer', as: 'answer_question'
  
  # Admin routes
  namespace :admin do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    root 'dashboard#index'
    get 'dashboard', to: 'dashboard#index'
    resources :questions
  end
end
