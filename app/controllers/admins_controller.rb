# This controller is only for listing and deleting admins. Other functions implemented in devise controllers.
class AdminsController < ApplicationController
	before_action :authenticate_admin!
	
	def index
		@admins = Admin.all
	end
	
	def destroy
		Admin.find(params[:id]).destroy
		redirect_to admins_path, notice: 'Администратор удален.'
	end
end