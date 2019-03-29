Dashboard para solicitudes de usuarios
-------------------------------------------

1. Consiste de un pequeño dashboard en el que los usuarios podrán publicar solicitudes, que serán valoradas positiva o negativamente, así como agregar comentarios en forma de hilo, asociados a cada solicitud

2. Cada solicitud tiene dos campos principales:
   - Titulo
   - Descripcion, más un botón denominado 'Publicar'

3. Por cada solicitud, se puede valorar positiva o negativamente y esto irá sumándose a cada rubro

4. Al mismo tiempo, en cada solicitud se podrá asociar comentarios, el cual es una opción vía modal (ventana emergente) que permitirá también listar los mismos vinculados a la solicitud

5. Esta aplicación fue elaborada en Ruby on Rails (v5), con BD postgresql (v9.6). Contiene dos tablas principales: solicitudes y comments, la segunda con un campo foráneo vinculado a la primera. Se pueden crear desde el entorno de programación con el comando: rake migrate

6. En el formulario de solicitudes, el campo descripcion está basado en la gema tinymce, para cumplir con el Rich Text Editor

7. El nombre de la BD, quedará a juicio del usuario final que probará la aplicación. Para este ejemplo, recibió el nombre: personal, perteneciente al usuario: postgres
