json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :short_description, :gallery, :size, :size_with_cover, :cover_size, :capacity, :volume, :net_volume, :parameters, :color, :var_color_price_1, :var_color_price_2, :var_color_price_3, :var_high_price_1, :var_high_price_2, :var_high_price_3, :var_spec_price_1, :var_spec_price_2, :var_spec_price_3, :featured
  json.url product_url(product, format: :json)
end
