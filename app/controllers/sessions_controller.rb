class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    employee = Employee.find_by(log_in_id: session_params[:log_in_id])

    if employee&.authenticate(session_params[:password]) 
      session[:employee_id] = employee.id
      redirect_to root_url, notice: 'ログインしました。'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'ログアウトしました。'
  end

  private

  def session_params
    params.require(:session).permit(:log_in_id, :password)
  end
end
