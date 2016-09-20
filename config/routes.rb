Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'

  get '/quiz/results', to: 'quizzes#results', as: 'results'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users, only: [:show]

  resources :categories, shallow: true do
    resources :subcategories do
      resources :tests
      resources :concepts do
        resources :quizzes
        resources :questions
      end
    end
  end
end
