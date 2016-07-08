Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => 'sessions' }
  get '/videos', to: 'application#home'
end
