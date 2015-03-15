Product.destroy_all
Type.destroy_all
Application.destroy_all

glukh1 = Type.create!(name: 'Глухие')
shtabel2 = Type.create!(name: 'Штабелируемые')
vklad3 = Type.create!(name: 'Вкладываемые')
reshet4 = Type.create!(name: 'Решетчатые')
perf5 = Type.create!(name: 'Перфорированные')
krysh6 = Type.create!(name: 'Крышки')
pall7 = Type.create!(name: 'Паллеты')

ryb1 = Application.create!(name: 'Рыбное производство')
ptits2 = Application.create!(name: 'Птицефабрики')
myas3 = Application.create!(name: 'Мясное производство')
ovosh4 = Application.create!(name: 'Хранение овощей')
vnutr5 = Application.create!(name: 'Внутрицеховая тара')
moloch6 = Application.create!(name: 'Молочное производство')
mnog7 = Application.create!(name: 'Многоцелевая тара')
sklad8 = Application.create!(name: 'Складская тара')
musor9 = Application.create!(name: 'Мусорные контейнеры')

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
	types: [shtabel2, vklad3, perf5],
	applications: [ryb1]
},




])

p "Created #{Product.count} products"
p "Created #{Type.count} types"
p "Created #{Application.count} applications"