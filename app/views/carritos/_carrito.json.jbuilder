json.extract! carrito, :id, :cantidad, :detalle_carrito_id, :id_usuario, :created_at, :updated_at
json.url carrito_url(carrito, format: :json)
