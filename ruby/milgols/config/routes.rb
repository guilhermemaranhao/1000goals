Rails.application.routes.draw do

  resources :sessions

  get :index, :controller => :gols
end
