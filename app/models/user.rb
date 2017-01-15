class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
#se le borro algo que deciaencryptedenelpassword
         attr_accessible :primer_nombre, :primer_apellido, :nombre_perfil, :email, :password,
         		:password_confirmation

#se puede interpretar como un usuario puede tener muchosstatuses, comprendiendo que tenemos un modelo en singular, aca lo ponemos en plural (es) y ruby lo interpreta como es
has_many :statuses

#validacion para que primer_nombre no pueda ser un campo vacio
validates :primer_nombre, presence: true

validates :primer_apellido, presence: true

#[....]->....estos puntos estan encapsulados en los corchetes

validates :nombre_perfil, presence: true,
	uniqueness: true,
	format: {
		with: /[a-zA-Z0-9_-]+/,
		message: 'debe estar formateado correctamente. (no debe llevar punto).'

	}
#esto es un metodo en el que se le hace llamado en ->show.html.erb(en el directorio de views/statuses) y en ->index.html.erb (en el directorio de views/statuses)
def nombre_completo
	primer_nombre+" "+primer_apellido
#fin del metodo
end
end
