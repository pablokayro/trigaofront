class Users::SessionsController < Devise::SessionsController
    # Desativar verificação de CSRF para API login
    skip_before_action :verify_authenticity_token, only: [:create]
  
    # O restante do código do Devise permanece igual
  end
  