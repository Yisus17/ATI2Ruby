require 'test_helper'

class CarritosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carrito = carritos(:one)
  end

  test "should get index" do
    get carritos_url
    assert_response :success
  end

  test "should get new" do
    get new_carrito_url
    assert_response :success
  end

  test "should create carrito" do
    assert_difference('Carrito.count') do
      post carritos_url, params: { carrito: { cantidad: @carrito.cantidad, detalle_carrito_id: @carrito.detalle_carrito_id, id_usuario: @carrito.id_usuario } }
    end

    assert_redirected_to carrito_url(Carrito.last)
  end

  test "should show carrito" do
    get carrito_url(@carrito)
    assert_response :success
  end

  test "should get edit" do
    get edit_carrito_url(@carrito)
    assert_response :success
  end

  test "should update carrito" do
    patch carrito_url(@carrito), params: { carrito: { cantidad: @carrito.cantidad, detalle_carrito_id: @carrito.detalle_carrito_id, id_usuario: @carrito.id_usuario } }
    assert_redirected_to carrito_url(@carrito)
  end

  test "should destroy carrito" do
    assert_difference('Carrito.count', -1) do
      delete carrito_url(@carrito)
    end

    assert_redirected_to carritos_url
  end
end
