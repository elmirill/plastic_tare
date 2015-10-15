class ContactForm < MailForm::Base
	attribute :name, validate: true
	attribute :contact, validate: true
	attribute :to
	attribute :message
	attribute :nickname, captcha: true
	
	def headers
		{
			subject: "Сообщение с сайта plast-tara.ru",
			to: CoreSetting.find(1).main_email,
			from: %("#{name}")
		}
	end
end
