class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  #rescue_from ActionController::InvalidAuthenticityToken do |exception|
    #sign_out_user # Example method that will destroy the user cookies
  #  p "Destruir cookies do usuário"
  #end


  private
  def require_login

  end

end
