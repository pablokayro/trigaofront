class Produto < ApplicationRecord
    has_many :produtos_encomendados
    has_many :encomendas, through: :produtos_encomendados

    # Validações
  validates :codigo, presence: true, uniqueness: true  # Código deve ser único e não pode estar em branco
  validates :nome, presence: true  # Nome é obrigatório
  validates :preco, numericality: { greater_than_or_equal_to: 0 }  # Preço deve ser maior ou igual a 0
  validates :quantidade, numericality: { only_integer: true, greater_than_or_equal_to: 0 }  # Quantidade deve ser um número inteiro maior ou igual a 0

end
  