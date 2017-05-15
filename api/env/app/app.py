from flask import Flask,jsonify,json,request
from flask_mysqldb import MySQL 

app= Flask(__name__)

app.config['MYSQL_HOST']= 'sql9.freemysqlhosting.net'
app.config['MYSQL_USER']= 'sql9174496'
app.config['MYSQL_PASSWORD']= 'RMsZnVcGka'
app.config['MYSQL_DB']= 'sql9174496'
mysql= MySQL(app)

#Metodo para traer todos los productos 
@app.route("/productos/", methods=['GET'])
def get_products():
	cur=mysql.connection.cursor()
	cur.execute('SELECT * FROM producto')

	respuesta= cur.fetchall() 
	product_list=[]
	for i in range (0,len(respuesta)):
		item={
			'id':respuesta[i][0],
			'id_categoria': respuesta[i][1],
			'nombre':respuesta[i][2],
			'descripcion':respuesta[i][3],
			'cantidad':respuesta[i][4],
			'precio':respuesta[i][5],
			'imagen':respuesta[i][6]}
		product_list.append(item)

	return jsonify(Productos=product_list)

#Metodo para traer un solo producto por su id
@app.route("/productos/<id>", methods=['GET'])
def get_product(id):
	cur=mysql.connection.cursor()
	cur.execute('SELECT * FROM producto where id=%s',(id))
	respuesta= cur.fetchall() 
	item={
		'id':respuesta[0][0],
		'id_categoria': respuesta[0][1],
		'nombre':respuesta[0][2],
		'descripcion':respuesta[0][3],
		'cantidad':respuesta[0][4],
		'precio':respuesta[0][5],
		'imagen':respuesta[0][6]}
		
	return jsonify(Producto=item)

#Metodo para agregar un producto nuevo
@app.route("/productos/",methods=['POST'])
def add_producto():
	
	#Se busca el ultimo id en la base de datos para insertar el nuevo POST
	cur=mysql.connection.cursor()
	cur.execute('SELECT max(id) from producto')
	maxid=cur.fetchone()#El retorno es una tupla de la forma (max_id,)
	

	data=json.loads(request.data)#Se carga la data del json recibido
	#Se llenan los datos del nuevo producto
	newid=maxid[0]+1
	nombre=data['nombre']
	descripcion=data['descripcion']
	cantidad=data['cantidad']
	precio=data['precio']
	imagen=data['imagen']
	id_categoria=data['id_categoria']
	

	#se inserta el nuevo producto
	cur.execute('INSERT INTO producto (id, nombre, descripcion, cantidad, precio, imagen, id_categoria) VALUES (%s, %s, %s, %s, %s, %s, %s)', (newid, nombre, descripcion, cantidad, precio, imagen, id_categoria ))
	cur.connection.commit()
	return "Done"

	#Lista de todos los productos, se revisa si el post fue agregado (Opcional)
	cur.execute('SELECT * FROM producto')
	respuesta= cur.fetchall() 
	product_list=[]
	for i in range (0,len(respuesta)):
		item={
			'id':respuesta[0][0],
			'nombre': respuesta[0][1],
			'descripcion':respuesta[0][2],
			'cantidad':respuesta[0][3],
			'precio':respuesta[0][4],
			'imagen':respuesta[0][5],
			'id_categoria':respuesta[0][6]}
		product_list.append(item)
	return jsonify(Productos=product_list)

#Metodo para traer todos los usuarios 
@app.route("/usuarios/", methods=['GET'])		
def get_usuarios():
	cur=mysql.connection.cursor()
	cur.execute('SELECT * FROM usuario')
	respuesta= cur.fetchall() 
	user_list=[]
	for i in range (0,len(respuesta)):
		item={
			'id':respuesta[i][0],
			'correo': respuesta[i][3],
			'password':respuesta[i][4],
			'nombre':respuesta[i][2],
			'apellido':respuesta[i][2]}
		user_list.append(item)

	return jsonify(Usuarios=user_list)

#Metodo para traer un solo usuario por su id
@app.route("/usuarios/<id>", methods=['GET'])
def get_usuario(id):
	cur=mysql.connection.cursor()
	cur.execute('SELECT * FROM usuario where id=%s',(id))
	respuesta= cur.fetchall() 
	item={
			'id':respuesta[0][0],
			'correo': respuesta[0][1],
			'password':respuesta[0][2],
			'nombre':respuesta[0][3],
			'apellido':respuesta[0][4]}
		
	return jsonify(Usuario=item)

#Metodo para agregar un usuario nuevo
@app.route("/usuarios/",methods=['POST'])
def add_usuario():
	
	#Se busca el ultimo id en la base de datos para insertar el nuevo POST
	cur=mysql.connection.cursor()
	cur.execute('SELECT max(id) from usuario')
	maxid=cur.fetchone()#El retorno es una tupla de la forma (max_id,)
	

	data=json.loads(request.data)#Se carga la data del json recibido
	#Se llenan los datos del nuevo usuario
	newid=maxid[0]+1
	nombre=data['nombre']
	apellido=data['apellido']
	correo=data['correo']
	password=data['password']
	

	#se inserta el nuevo usuario
	cur.execute('INSERT INTO usuario (id, nombre, apellido, correo, password) VALUES (%s, %s, %s, %s, %s)', (newid, nombre, apellido, correo, password ))
	cur.connection.commit()
	return "Done"

#Metodo para iniciar sesion
@app.route("/usuarios/login",methods=['POST'])
def login():
	
	cur=mysql.connection.cursor()
	data=json.loads(request.data)#Se carga la data del json recibido
	#Se llenan los datos del nuevo producto
	correo=data['correo']
	password=data['password']
	
	estado_query=cur.execute('SELECT * FROM usuario where correo= %s and password = %s', (correo, password))
	respuesta= cur.fetchall() 

	if estado_query==1:	
		#OPCIONAL
		item={
			'correo': respuesta[0][1],
			'password':respuesta[0][2]}
		return  "Usuario encontrado"
	else:
		return "Usuario o clave invalid@/s"

@app.route('/')
def index():
	return "hi"

if __name__=="__main__":
	app.run(debug=True)