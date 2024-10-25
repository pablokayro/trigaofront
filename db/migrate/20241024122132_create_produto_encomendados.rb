class CreateProdutoEncomendados < ActiveRecord::Migration[7.2]
  def change
    create_table :produto_encomendados do |t|
      t.references :encomenda, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
