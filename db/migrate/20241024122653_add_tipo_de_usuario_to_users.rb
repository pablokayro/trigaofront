class AddTipoDeUsuarioToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :tipo_de_usuario, :integer, default: 0 # 0 = Padrão, 1 = Master
  end
end
