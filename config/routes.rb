Rails.application.routes.draw do
  resources :channels, except: :show
  resources :videos, except: :show
  get '/notify', to: 'application#notify'
  post '/notify', to: 'application#notify'

  devise_for :users, :controllers => { :sessions => 'sessions' }

  root :to => 'channels#index'

  namespace 'api' do
    resources :categories, only: :index
    resources :videos, only: :index
  end
end
