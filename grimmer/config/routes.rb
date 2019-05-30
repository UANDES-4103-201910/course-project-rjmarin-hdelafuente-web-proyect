Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "callbacks" }
  resources :geofences
  resources :bans
  resources :dumpsters
  resources :blacklists
  resources :post_reports
  resources :post_votes
  resources :post_shares
  resources :post_comments
  resources :post_attachments
  defaults format: :json do
    resources :users, :posts
  end
  resources :user_profiles
  resources :users
  resources :home do
    member do
      put "like", to: "home#like"
      put "dislike", to: "home#dislike"
    end
  end
  resources :my_posts
  resources :popular_posts
  resources :admin
  root 'home#index'

  post '/login',   to: 'sessions#create', as: :log_in
  delete '/log_out' => 'sessions#destroy', as: :log_out

  get '/sign_in' => 'registrations#new', as: :registrations
  post '/sign_in' => 'registrations#create', as: :sign_in
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
