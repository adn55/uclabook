class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

def configure_permitted_parameters
	#la siguiente linea la explicaron asi en el video y resulto bien, pero a mi no, sin embargo, buscando en la documentacion de devise, al parecer ya no se usa asi, sino mo sigue despues de la siguiente linea
	#devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:primer_nombre, :primer_apellido, :nombre_perfil, :email, :password, :password_confirmation) }


	devise_parameter_sanitizer.permit(:sign_up, keys: [:primer_nombre, :primer_apellido, :nombre_perfil, :email, :password, :password_confirmation])

end
end
