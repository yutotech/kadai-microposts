Rails.application.routes.draw do
    root to: "toppages#index"
    
    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
    
    get "signup", to: "users#new"
    resources :users, only: [:index, :show, :new, :create] do
        member do
            get :followings
            get :followers
            # 追記箇所
            get :likes
        end
    end
    resources :microposts, only: [:create, :destroy]
    resources :relationships, only: [:create, :destroy]
    # 追記箇所
    resources :favorites, only: [:create, :destroy]
end
