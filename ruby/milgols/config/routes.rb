Rails.application.routes.draw do

  root 'gols#index'

  post :logar, :controller => :usuarios

end
