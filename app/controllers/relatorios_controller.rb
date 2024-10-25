class RelatoriosController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource class: false
  
    # Relatório diário, semanal, mensal de produtos vendidos
    def produtos_vendidos
      @produtos_vendidos = ProdutoEncomendado
        .where("created_at >= ?", 1.day.ago)
        .group(:produto_id)
        .sum(:quantidade)
        
      render json: @produtos_vendidos
    end
  
    # Relatório específico para pães
    def paes_vendidos
      @paes_vendidos = ProdutoEncomendado
        .joins(:produto)
        .where(produtos: { secao: 'pao' })
        .group(:produto_id)
        .sum(:quantidade)
  
      render json: @paes_vendidos
    end
  end
  