class CreateEncomendas < ActiveRecord::Migration[7.2]
  def change
    create_table :encomendas do |t|
      t.string :nome_do_cliente
      t.datetime :data_de_entrega
      t.string :numero_de_contato
      t.decimal :valor_do_pedido
      t.string :tipo_de_pagamento

      t.timestamps
    end
  end
end
