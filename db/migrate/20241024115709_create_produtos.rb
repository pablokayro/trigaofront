class CreateProdutos < ActiveRecord::Migration[7.2]
  def change
    create_table :produtos do |t|
      t.string :codigo, null: false
      t.string :nome, null: false
      t.string :secao
      t.decimal :preco, precision: 8, scale: 2, default: 0.0
      t.string :unidade
      t.integer :quantidade, default: 0

      t.timestamps
    end
    add_index :produtos, :codigo, unique: true
  end
end
