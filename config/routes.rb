Rails.application.routes.draw do
  resources :categories
  resources :videos
  devise_for :users, :controllers => { :sessions => 'sessions' }
  
  namespace 'api' do
    resources :categories, only: :index
    resources :videos, only: :index        
  end
end
