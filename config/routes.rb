Rails.application.routes.draw do
  resources :categories, except: :show
  resources :videos, except: :show do
    collection do
      get :upload_csv
      post :upload_csv
      post :create_multiple
    end
  end
  devise_for :users, :controllers => { :sessions => 'sessions' }

  root :to => 'videos#index'

  namespace 'api' do
    resources :categories, only: :index
    resources :videos, only: :index        
  end
end
