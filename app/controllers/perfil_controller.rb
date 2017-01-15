class PerfilController < ApplicationController
  def show

#variable en instancia  para asignar toda la info que puede tener un usuario
@user = User.find_by_nombre_perfil(params[:id])
#si el usuario existe
if @user
	#mostrar todos los status pero de este mismo usuario (eso no me convence)
	@statuses = @user.statuses.all
#render->mostrar cierta info
	render action: :show
else
	render file: 'public/404', status: 404, formats: [:html]
end

  end
end
