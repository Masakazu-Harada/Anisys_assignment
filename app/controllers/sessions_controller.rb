class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    employee = Employee.find_by(log_in_id: session_params[:log_in_id])
  
    if employee&.authenticate(session_params[:password])
      employee.update(login_attempts: 0, enable: Employee.enables[:active]) # ログイン成功時に試行回数をリセットし、アカウントをアクティブにする
      session[:employee_id] = employee.id
      redirect_to root_url, notice: 'ログインしました。'
    else
      if employee
        employee.increment!(:login_attempts)
        if employee.login_attempts >= 5 # ログイン試行回数が5回以上の場合
          employee.update(enable: Employee.enables[:inactive]) # アカウントを非アクティブ（ロック）状態にする
          redirect_to login_url, alert: 'ログイン試行回数が上限に達したため一時的にアカウントをロックしました。'
        else
          flash.now[:alert] = 'ログインIDまたはパスワードが間違っています。'
          render :new
        end
      else
        flash.now[:alert] = '該当する従業員が見つかりません。'
        render :new
      end
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
