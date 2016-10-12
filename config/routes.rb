Rails.application.routes.draw do
  get '/', to: 'home#index'
  get '/auth/linkedin-oauth2/callback', to: 'linkedin#create'
  get '/auth/google_oauth2/callback', to: 'googledrive#create'
  get '/guests/:year/:month', to: 'guests#index'
end
