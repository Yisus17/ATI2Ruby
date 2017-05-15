require 'test_helper'

class DetalleCarritosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalle_carrito = detalle_carritos(:one)
  end

  test "should get index" do
    get detalle_carritos_url
    assert_response :success
  end

  test "should get new" do
    get new_detalle_carrito_url
    assert_response :success
  end

  test "should create detalle_carrito" do
    assert_difference('DetalleCarrito.count') do
      post detalle_carritos_url, params: { detalle_carrito: { carrito_id: @detalle_carrito.carrito_id, id_producto: @detalle_carrito.id_producto, status: @detalle_carrito.status } }
    end

    assert_redirected_to detalle_carrito_url(DetalleCarrito.last)
  end

  test "should show detalle_carrito" do
    get detalle_carrito_url(@detalle_carrito)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalle_carrito_url(@detalle_carrito)
    assert_response :success
  end

  test "should update detalle_carrito" do
    patch detalle_carrito_url(@detalle_carrito), params: { detalle_carrito: { carrito_id: @detalle_carrito.carrito_id, id_producto: @detalle_carrito.id_producto, status: @detalle_carrito.status } }
    assert_redirected_to detalle_carrito_url(@detalle_carrito)
  end

  test "should destroy detalle_carrito" do
    assert_difference('DetalleCarrito.count', -1) do
      delete detalle_carrito_url(@detalle_carrito)
    end

    assert_redirected_to detalle_carritos_url
  end
end
