json.array!(@core_settings) do |core_setting|
  json.extract! core_setting, :id, :name, :main_phone, :add_phone_1, :add_phone_2, :main_phone_multi, :add_phone_1_multi, :add_phone_2_multi, :main_email, :add_email, :address, :address_comment, :site_description, :map_lat, :map_lng, :map_name
  json.url core_setting_url(core_setting, format: :json)
end
