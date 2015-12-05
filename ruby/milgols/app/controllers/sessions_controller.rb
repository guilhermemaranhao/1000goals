class SessionsController < ApplicationController

  def create
    usuario = Usuario.where(["email = ? and senha = ?", params[:email], params[:senha]]).first
    if (usuario)
      session[:current_user_id] = usuario.id
    end

  end
end
