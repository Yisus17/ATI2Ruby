class CreateProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :cantidad
      t.float :precio
      t.string :imagen
      t.integer :id_categoria

      t.timestamps
    end
  end
end
