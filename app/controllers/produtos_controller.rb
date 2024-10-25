class ProdutosController < ApplicationController
  # Cancancan verificará permissões
  load_and_authorize_resource  

  # Callbacks
  before_action :set_produto, only: [:show, :update, :destroy]

  # GET /produtos
  def index
    @produtos = Produto.page(params[:page]).per(15)  # 15 produtos por página
    render json: @produtos
  end

  # GET /produtos/:id
  def show
    render json: @produto
  end

  # POST /produtos
  def create
    @produto = Produto.new(produto_params)
    if @produto.save
      render json: @produto, status: :created
    else
      render json: @produto.errors, status: :unprocessable_entity
    end
  end

  # PUT /produtos/:id
  def update
    if @produto.update(produto_params)
      render json: @produto
    else
      render json: @produto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /produtos/:id
  def destroy
    @produto.destroy
    head :no_content
  end

  # GET /produtos/busca?query=...
  def search
    if params[:query].present?
      @produtos = Produto.where("nome ILIKE ? OR codigo ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @produtos = Produto.none
    end
    render json: @produtos
  end

  private

  # Callback para definir produto baseado no ID
  def set_produto
    @produto = Produto.find(params[:id])
  end

  # Strong parameters
  def produto_params
    params.require(:produto).permit(:codigo, :nome, :secao, :preco, :unidade, :quantidade)
  end
end
