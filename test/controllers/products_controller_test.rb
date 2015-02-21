require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { application: @product.application, capacity: @product.capacity, color: @product.color, color_var: @product.color_var, color_var_price_1: @product.color_var_price_1, color_var_price_2: @product.color_var_price_2, color_var_price_3: @product.color_var_price_3, description: @product.description, gallery: @product.gallery, high_var: @product.high_var, high_var_price_1: @product.high_var_price_1, high_var_price_2: @product.high_var_price_2, high_var_price_3: @product.high_var_price_3, kind: @product.kind, name: @product.name, parameter: @product.parameter, size: @product.size, spec_var: @product.spec_var, spec_var_price_1: @product.spec_var_price_1, spec_var_price_2: @product.spec_var_price_2, spec_var_price_3: @product.spec_var_price_3, volume: @product.volume }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { application: @product.application, capacity: @product.capacity, color: @product.color, color_var: @product.color_var, color_var_price_1: @product.color_var_price_1, color_var_price_2: @product.color_var_price_2, color_var_price_3: @product.color_var_price_3, description: @product.description, gallery: @product.gallery, high_var: @product.high_var, high_var_price_1: @product.high_var_price_1, high_var_price_2: @product.high_var_price_2, high_var_price_3: @product.high_var_price_3, kind: @product.kind, name: @product.name, parameter: @product.parameter, size: @product.size, spec_var: @product.spec_var, spec_var_price_1: @product.spec_var_price_1, spec_var_price_2: @product.spec_var_price_2, spec_var_price_3: @product.spec_var_price_3, volume: @product.volume }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
