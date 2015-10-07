class CartMailer < ApplicationMailer
	default from: "plast.tara.site@gmail.com"
	
	def send_cart_contents(order)
		@order = order
		mail(to: "ant.khay@gmail.com", subject: 'Заказ с сайта plat-tara.ru')
	end
end
