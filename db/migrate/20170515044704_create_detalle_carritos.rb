class CreateDetalleCarritos < ActiveRecord::Migration[5.1]
  def change
    create_table :detalle_carritos do |t|
      t.integer :id_producto
      t.integer :carrito_id
      t.boolean :status

      t.timestamps
    end
  end
end
