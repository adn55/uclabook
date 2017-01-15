class Status < ActiveRecord::Base
	#acceso al componente contenido
	attr_accessible :contenido, :user_id

	#hace referencia a que este modelo pertence a user, y es como parte de la relacion de que muchos status pertenecen a aun usuario
	belongs_to :user

#lenght: { minimum: 2}->minimo debe llevar dos caracteres
validates :contenido, presence: true,
	length: { minimum: 2 }

validates :user_id, presence: true

end
