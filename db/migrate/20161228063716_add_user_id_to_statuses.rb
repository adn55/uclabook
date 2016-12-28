class AddUserIdToStatuses < ActiveRecord::Migration
  def change

#agregar una nueva columna  a statuses que se llame user_id y que sea un entero
  	add_column :statuses, :user_id, :integer
  	#agregar un nevo index para representar cada uno de los status y asociarlo con el identificador del respectivo usuario
  	add_index :statuses, :user_id
  	#notar que los valores para agregar la columna y el index difieren porque son operaciones distintas

  	#finalmente vamos a remover una columna en statues que es la que se llama nombre, en elarchivo db>migrate 201612..._create_statuses.rb verificamos que si se llama nombre en la seccion de codigo donde se crea la tabla
  	remove_column :statuses, :nombre
  	#hecho lo anterior se debe ir al gitbash y ejecutar el comando rake db:migrate

  	#creo que se puede decir que hecho todo lo anterior este archivo realizo (ciertamente dijo que actualizaciones se hiban a hacer en la bd con sus detalles) o fue responsable de lo migracion realizada, notae que al ejecutar el comando rake db:migrate al principio se imprimio :20161228063716 AddUserIdToStatuses: migrating y al final: 20161228063716 AddUserIdToStatuses: migrated (0.1595s) despues de imprimir cierta info se imprimio
  end
end
