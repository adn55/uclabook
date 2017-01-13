require 'test_helper'

class RutasPersonalizadasTest < ActionDispatch::IntegrationTest

 test "el /login abre la pagina de inicio de sesion" do
 	get '/comenzar'
 	#creo que es para verificar si la pagina si respondio exitosamente
 	assert_response :success
end

 test "el /logout abre la pagina de cerrar sesion" do
 	get '/destruir'
 	assert_response :success
 #como estamos destruyendo la session tenemos que redirigir la pagina a alguna otra pagina (en este caso para en index, o sea la pag principal, que para ello solo basta "/"), si no hacemos esto nos saldra un error 302 que es un de los codigos de error en el navegador que hacen referencia a que la pagina se encontro pero no se puede mostrar. y esto solamente no basta para dar solucion al problema ya qye hay que realizar ciertos codigos(programacion) en el archivo routes.rb assert_redirected_to '/'

end

 test "el /lregistro abre la pagina de registrar usuario" do
 	get '/registrar'
 	assert_response :success
end

end
