Rails.application.routes.draw do

  post :logar, :controller => :application

  get :index, :controller => :gols
end
