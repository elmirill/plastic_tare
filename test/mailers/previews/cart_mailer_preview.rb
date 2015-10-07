# Preview all emails at http://localhost:3000/rails/mailers/cart_mailer
class CartMailerPreview < ActionMailer::Preview
	def cart_mailer_preview
		CartMailer.send_cart_contents(Order.first)
	end
end
