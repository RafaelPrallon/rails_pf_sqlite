class ChangeEstadomedidorAtMedidors < ActiveRecord::Migration
  def change
    change_column :medidors, :estadoMedidor, :boolean
  end
end
