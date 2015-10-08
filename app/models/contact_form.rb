class ContactForm < MailForm::Base
	attribute :name, validate: true
	attribute :contact, validate: true
	attribute :message
	attribute :nickname, captcha: true
	
	def headers
		{
			subject: "Сообщение с сайта plast-tara.ru",
			to: "info@plast-tara.ru",
			from: %("#{name}")
		}
	end
end
