class ContactFormMailerController < ApplicationController

	def send_form
		name = params[:form_name]
		contact = params[:form_contact]
		message = params[:form_message]
		captcha = params[:form_nickname]
		to = @core_setting.main_email
		if captcha.empty?
			if ContactFormMailer.email_form(name, contact, message, to).deliver
				redirect_to :back, notice: "Сообщение отправлено."
			else
				flash.now[:alert] = "Ошибка! Сообщение не отправлено."
			end
		else
			flash.now[:alert] = "Тест Тьюринга не пройден."
		end
	end

end