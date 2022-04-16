Rails.application.routes.draw do
  devise_for :users
  root 'users#show'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:index, :show, :new, :create ]
    resources :likes, only: [:index, :show, :new, :create ]
  end

end
