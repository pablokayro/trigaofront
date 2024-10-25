class User < ApplicationRecord
  enum tipo_de_usuario: { padrao: 0, master: 1 }

  # Devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
