class CartMailer < ApplicationMailer
	default from: "plast.tara.site@gmail.com"
	
	def send_cart_contents(order)
		@order = order
		mail(from: "#{@order.customer_name} <plast.tara.site@gmail.com>", to: "ant.khay@gmail.com", subject: "Заказ ##{@order.id} с сайта plast-tara.ru")
	end
end