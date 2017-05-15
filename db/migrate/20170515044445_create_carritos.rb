class CreateCarritos < ActiveRecord::Migration[5.1]
  def change
    create_table :carritos do |t|
      t.integer :cantidad
      t.integer :detalle_carrito_id
      t.integer :id_usuario

      t.timestamps
    end
  end
end
