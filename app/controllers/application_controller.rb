class ApplicationController < ActionController::Base
  helper_method :current_employee
  before_action :login_required

  add_flash_types :success, :info, :warning, :danger

  private

  def current_employee
    @current_employee ||= Employee.find_by(id: session[:employee_id]) if session[:employee_id]
  end

  def login_required
    redirect_to login_url unless current_employee
  end
end
