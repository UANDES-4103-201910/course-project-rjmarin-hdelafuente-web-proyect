Rails.application.routes.draw do
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
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
