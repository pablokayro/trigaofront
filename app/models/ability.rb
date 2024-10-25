class Ability
  include CanCan::Ability

  def initialize(user)
    # Usuário não autenticado (guest)
    return unless user.present?

    # Permissões para Usuário Padrão
    if user.padrao?
      can :read, Produto  # Permissão para ver produtos
      can :search, Produto  # Permissão para buscar produtos
      can :update, Produto  # Pode atualizar a quantidade de produtos
      can :create, Encomenda  # Pode registrar encomendas
    end

    # Permissões para Usuário Master
    if user.master?
      can :manage, :all  # Pode gerenciar tudo (produtos, encomendas, relatórios, etc.)
    end
  end
end
