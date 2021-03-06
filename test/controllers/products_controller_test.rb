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
      post :create, product: { capacity: @product.capacity, color: @product.color, cover_size: @product.cover_size, description: @product.description, featured: @product.featured, gallery: @product.gallery, name: @product.name, net_volume: @product.net_volume, parameters: @product.parameters, short_description: @product.short_description, size: @product.size, size_with_cover: @product.size_with_cover, var_color: @product.var_color, var_color_price_1: @product.var_color_price_1, var_color_price_2: @product.var_color_price_2, var_color_price_3: @product.var_color_price_3, var_high: @product.var_high, var_high_price_1: @product.var_high_price_1, var_high_price_2: @product.var_high_price_2, var_high_price_3: @product.var_high_price_3, var_spec: @product.var_spec, var_spec_price_1: @product.var_spec_price_1, var_spec_price_2: @product.var_spec_price_2, var_spec_price_3: @product.var_spec_price_3, volume: @product.volume }
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
    patch :update, id: @product, product: { capacity: @product.capacity, color: @product.color, cover_size: @product.cover_size, description: @product.description, featured: @product.featured, gallery: @product.gallery, name: @product.name, net_volume: @product.net_volume, parameters: @product.parameters, short_description: @product.short_description, size: @product.size, size_with_cover: @product.size_with_cover, var_color: @product.var_color, var_color_price_1: @product.var_color_price_1, var_color_price_2: @product.var_color_price_2, var_color_price_3: @product.var_color_price_3, var_high: @product.var_high, var_high_price_1: @product.var_high_price_1, var_high_price_2: @product.var_high_price_2, var_high_price_3: @product.var_high_price_3, var_spec: @product.var_spec, var_spec_price_1: @product.var_spec_price_1, var_spec_price_2: @product.var_spec_price_2, var_spec_price_3: @product.var_spec_price_3, volume: @product.volume }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
