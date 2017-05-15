json.extract! detalle_carrito, :id, :id_producto, :carrito_id, :status, :created_at, :updated_at
json.url detalle_carrito_url(detalle_carrito, format: :json)
