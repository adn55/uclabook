require 'test_helper'

class UserTest < ActiveSupport::TestCase

test "un usuario deberia ingresar su primer nombre" do

user = User.new
#assert es propio para pruebas y dirige el comportamiento
#con !user.save estamos diciendole a rails que no agregue esta prueba de creacion de usuario a la base de datos
assert !user.save
#quiero probar si el campo primer_nombre esta vacio o no para ello->empty?
assert !user.errors[:primer_nombre].empty?
end

test "un usuario deberia ingresar su primer apellido" do

user = User.new

assert !user.save

assert !user.errors[:primer_apellido].empty?
end

test "un usuario deberia ingresar su nombre de perfil" do

user = User.new

assert !user.save

assert !user.errors[:nombre_perfil].empty?
end

test "un usuario deberia tener un nombre de perfil unico" do
	user = User.new
	#lo siguente se relaciona con el "oja" en el archivo users.yml
user.nombre_perfil = users(:oja).nombre_perfil

assert !user.save
assert !user.errors[:nombre_perfil].empty?
end

test "un usuario entrar su nombre de perfil con formato" do
	user=User.new

#user.nombre_perfil = "mi nombre con espacios"

assert !user.save
assert !user.errors[:nombre_perfil].include?("debe estar formateado correctamente")
end

end