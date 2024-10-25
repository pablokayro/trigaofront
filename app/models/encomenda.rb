class Encomenda < ApplicationRecord
    has_many :produtos_encomendados
    has_many :produtos, through: :produtos_encomendados
    
  # Validações
  validates :nome_do_cliente, presence: true  # Nome do cliente é obrigatório
  validates :numero_de_contato, presence: true, format: { with: /\A\d{10,11}\z/, message: "deve ter 10 ou 11 dígitos" }  # Validação para número de telefone
  validates :valor_do_pedido, numericality: { greater_than_or_equal_to: 0 }  # Valor do pedido deve ser maior ou igual a 0
  validates :data_de_entrega, presence: true  # Data de entrega é obrigatória
end
  