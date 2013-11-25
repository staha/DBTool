class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, :authenticate_admin

  protected

  def authenticate_admin
  	#raise 'unauthorized!' unless current_user && current_user.is_admin? == false

  end

end
