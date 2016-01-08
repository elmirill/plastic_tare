class OrderPdf < Prawn::Document
	def initialize(order)
    super()
		@order = order
    header
		order_content
		client_info
  end

  def header
		logopath =  "#{Rails.root}/app/assets/images/logo.png"
		image logopath, width: 105, height: 61, at: [0, 720]
    font("lib/fonts/arial.ttf") do
			draw_text "«Пласт-Тара»", size: 16, at: [2, 640]
			bounding_box([340, 720], width: 200, height: 100) do
				text "г. Новосибирск", size: 11, align: :right
				move_down 5
				text "ул. Станционная 30/А, корпус 10", size: 11, align: :right
				move_down 5
				text "+7 (383) 349-94-84", size: 11, align: :right
				move_down 5
				text "info@plast-tara.ru", size: 11, align: :right
			end
			stroke do
				horizontal_line -10, 550, at: 625
			end
			move_down 30
		end
  end

	def order_content
		
		font("lib/fonts/arial.ttf") do
			data = [["Номер заказа:", @order.id], ["Дата заказа:", Time.now.strftime("%d.%m.%Y")]]
			table data, position: :right, cell_style: { size: 9 }
		end
		
		move_down 35
		
		font("lib/fonts/arial.ttf") do
			data = [["<font size='11'>Наименование товара</font>",
							"<font size='11'>Количество, шт.</font>",
							"<font size='11'>Общая цена, руб.</font>"]]
			
			@order.order_items.each do |oi|
				if oi.color_quantity.present? && oi.color_quantity > 0
					data += [[oi.product.name + " (Цветной)", oi.color_quantity,	oi.color_quantity * oi.var_price("color")]]
				end
				if oi.high_quantity.present? && oi.high_quantity > 0
					data += [[oi.product.name + " (Высший сорт)", oi.high_quantity,	oi.high_quantity * oi.var_price("high")]]
				end
				if oi.spec_quantity.present? && oi.spec_quantity > 0
					data += [[oi.product.name + " (Спецпредложение)", oi.spec_quantity,	oi.spec_quantity * oi.var_price("spec")]]
				end
			end
			
			data += [["", "", "<font size='11'>Итого: " + @order.total.to_s + "</font>"]]
			table data, position: :left, cell_style: { size: 10, inline_format: true }, width: 540, header: true, row_colors: ["dddddd", "ffffff"]
		end

		move_down 40
		
  end
	
	def client_info
		font("lib/fonts/arial.ttf") do
			text "Комментарий заказчика:", size: 14
			move_down 10
			text @order.customer_message, size: 10
		end
	end
	
end