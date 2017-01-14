require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end
#este archivo se genero automaticamente y se le editaron ciertas cosas
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end
#obtener un nuevo post (habia algo aca en este test generado automaticamente y se edito)(incluido el nombre o titulo del propio test)
  test "debe ser redirigido cuando no ha iniciado sesion" do
    get :new
    assert_response :redirect

    #para que cuando quiera crear un post tenga que iniciar sesion primero
    assert_redirected_to new_user_session_path
  end

test "debe iniciar sesion para hacer un post" do
  post :create, status: { contenido: "Hola Mundo"}
  assert_response :redirect
  assert_redirected_to new_user_session_path
end
test "deberia mostrar la nueva pagina cuando inicio sesion" do
#lo que sigue es una herramienta de devise
#ojala es el nombre del usuario que esta en users.yml
sign_in users(:ojala)
#obtener una nueva pagina que es en la que el puede crear los post
get :new
#asegurarnos de que fue exitosa la prueba
assert_response :success
end

  test "should create status" do
   sign_in users(:ojala)
    assert_difference('Status.count') do
      post :create, status: { contenido: @status.contenido }
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @status
    assert_response :success
  end

  test "should update status" do
    patch :update, id: @status, status: { contenido: @status.contenido }
    assert_redirected_to status_path(assigns(:status))
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
