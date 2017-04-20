Rails.application.routes.draw do
  resources :channels, except: :show
  resources :videos, except: :show
  get '/notify', to: 'application#notify'
  post '/notify', to: 'application#notify'

  get '/channels/updatevideos/:id', to: 'channels#update_videos_in_channel', as: 'update_videos_in_channel'

  devise_for :users, :controllers => { :sessions => 'sessions' }

  root :to => 'channels#index'

  namespace 'api' do
    resources :channels, only: :index
    resources :videos, only: :index
  end
end
