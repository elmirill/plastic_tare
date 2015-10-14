require 'test_helper'

class CoreSettingsControllerTest < ActionController::TestCase
  setup do
    @core_setting = core_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:core_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create core_setting" do
    assert_difference('CoreSetting.count') do
      post :create, core_setting: { add_email: @core_setting.add_email, add_phone_1: @core_setting.add_phone_1, add_phone_1_multi: @core_setting.add_phone_1_multi, add_phone_2: @core_setting.add_phone_2, add_phone_2_multi: @core_setting.add_phone_2_multi, address: @core_setting.address, address_comment: @core_setting.address_comment, main_email: @core_setting.main_email, main_phone: @core_setting.main_phone, main_phone_multi: @core_setting.main_phone_multi, map_lat: @core_setting.map_lat, map_lng: @core_setting.map_lng, map_name: @core_setting.map_name, name: @core_setting.name, site_description: @core_setting.site_description }
    end

    assert_redirected_to core_setting_path(assigns(:core_setting))
  end

  test "should show core_setting" do
    get :show, id: @core_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @core_setting
    assert_response :success
  end

  test "should update core_setting" do
    patch :update, id: @core_setting, core_setting: { add_email: @core_setting.add_email, add_phone_1: @core_setting.add_phone_1, add_phone_1_multi: @core_setting.add_phone_1_multi, add_phone_2: @core_setting.add_phone_2, add_phone_2_multi: @core_setting.add_phone_2_multi, address: @core_setting.address, address_comment: @core_setting.address_comment, main_email: @core_setting.main_email, main_phone: @core_setting.main_phone, main_phone_multi: @core_setting.main_phone_multi, map_lat: @core_setting.map_lat, map_lng: @core_setting.map_lng, map_name: @core_setting.map_name, name: @core_setting.name, site_description: @core_setting.site_description }
    assert_redirected_to core_setting_path(assigns(:core_setting))
  end

  test "should destroy core_setting" do
    assert_difference('CoreSetting.count', -1) do
      delete :destroy, id: @core_setting
    end

    assert_redirected_to core_settings_path
  end
end
