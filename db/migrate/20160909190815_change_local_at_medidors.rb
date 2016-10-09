class ChangeLocalAtMedidors < ActiveRecord::Migration
  def change
    add_column :medidors, :idLocal, :integer
  end
end
