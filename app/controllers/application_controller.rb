class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_types_and_applications

  def get_types_and_applications
    @types = Type.all
    @applications = Application.all
  end
end
