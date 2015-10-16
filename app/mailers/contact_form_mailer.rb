class ContactFormMailer < ApplicationMailer
	
	def email_form(name, contact, message, to)
		@name = name
		@contact = contact
		@message = message
		@to = to
		mail(from: "#{@name} <plast.tara.site@gmail.com>", to: @to,
																						subject: "Сообщение с сайта plast-tara.ru")
	end
end
