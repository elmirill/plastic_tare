class CartMailer < ApplicationMailer
	default from: "plast.tara.site@gmail.com"
	
	def send_cart_contents(order, to)
		@order = order
		mail(from: "#{@order.customer_name} <plast.tara.site@gmail.com>", to: to, subject: "Заказ ##{@order.id} с сайта plast-tara.ru")
	end
end