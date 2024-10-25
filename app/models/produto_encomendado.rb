class ProdutoEncomendado < ApplicationRecord
  belongs_to :encomenda
  belongs_to :produto
  
  validates :quantidade, presence: true, numericality: { greater_than: 0 }
end
