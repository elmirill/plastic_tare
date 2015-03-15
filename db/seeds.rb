Product.destroy_all
ProductType.destroy_all

glukh1 = ProductType.create!(name: 'Глухие')
shtabel2 = ProductType.create!(name: 'Штабелируемые')
vklad3 = ProductType.create!(name: 'Вкладываемые')
reshet4 = ProductType.create!(name: 'Решетчатые')
perf5 = ProductType.create!(name: 'Перфорированные')
krysh6 = ProductType.create!(name: 'Крышки')
pall7 = ProductType.create!(name: 'Паллеты')

Product.create!([{
	name: "Ящик №10 (Овощной)",
	description: "Ящик пластиковый для транспортировки, хранения и быстрого охлаждения пищевой продукции: ягод, овощей, фруктов и другой пищевой и непищевой продукции. Ящики штабелируются друг на друга в заполненном виде в несколько ярусов, оптимизируя пространство при товародвижении. В пустом виде эти ящики поворачиваются на 180 градусов и вставляются друг в друга для возвратной транспортировки или складирования.",
	short_description: "Ящик пластиковый для транспортировки, хранения и быстрого охлаждения пищевой продукции: ягод, овощей, фруктов и другой пищевой и непищевой продукции.",
	gallery: "http://plast-tara.ru/var/image_cache/wi169__files_flib_35.jpg','http://plast-tara.ru/var/image_cache/wi169__files_flib_36.jpg','http://plast-tara.ru/var/image_cache/wi169__files_flib_37.jpg",
	size: "600*400*130",
	# size_with_cover: "",
	# cover_size: "",
	# capacity: "",
	volume: 18,
	net_volume: 15,
	parameter: "стенки и дно ящика перфорированные",
	color: "'стандартный: красный, зелёный, синий;','любой по желанию заказчика от партии 500 шт.'",
	var_color: true,
	var_color_price_1: 252,
	var_color_price_2: 240,
	var_color_price_3: 228,
	var_high: true,
	var_high_price_1: 336,
	var_high_price_2: 320,
	var_high_price_3: 305,
	var_spec: false,
	# var_spec_price_1: ,
	# var_spec_price_2: ,
	# var_spec_price_3: ,
	featured: false,
	product_type: shtabel2
},




])