json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :gallery, :kind, :application, :size, :capacity, :volume, :parameter, :color, :color_var, :color_var_price_1, :color_var_price_2, :color_var_price_3, :high_var, :high_var_price_1, :high_var_price_2, :high_var_price_3, :spec_var, :spec_var_price_1, :spec_var_price_2, :spec_var_price_3
  json.url product_url(product, format: :json)
end
