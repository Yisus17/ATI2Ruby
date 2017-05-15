json.extract! usuario, :id, :nombre, :apellido, :correo, :password, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
