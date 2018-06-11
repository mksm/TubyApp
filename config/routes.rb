Rails.application.routes.draw do
  resources :channels, except: :show do
    collection do
      get :upload_csv
      post :upload_csv
    end
    member do
      put :update_videos
    end
  end
  resources :videos, except: :show
  get '/notify', to: 'application#notify'
  post '/notify', to: 'application#notify'

  devise_for :users, :controllers => { :sessions => 'sessions' }

  root :to => 'channels#index'

  namespace 'api' do
    resources :channels, only: :index
    resources :videos, only: :index
  end
end
