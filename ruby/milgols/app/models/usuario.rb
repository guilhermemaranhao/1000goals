class Usuario < ActiveRecord::Base

  def criar
    self.senha = has_se
  end

  def has_secure_password

  end

end
