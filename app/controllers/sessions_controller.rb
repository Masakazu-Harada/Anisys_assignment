class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    employee = Employee.find_by(log_in_id: session_params[:log_in_id])
  
    if employee&.authenticate(session_params[:password])
      # ログイン成功時に試行回数をリセットし、アカウントをアクティブにする
      employee.update(login_attempts: 0, enable: Employee.enables[:active]) 
      session[:employee_id] = employee.id
      redirect_to root_url, notice: 'ログインしました。'
    else
      flash.now[:alert] = 'ログインIDまたはパスワードが間違っています。'
      render_login_failure(employee)
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

  def render_login_failure(employee)
    if employee.present? # ログインIDが存在するかどうかを判定
      employee.increment!(:login_attempts) # ログイン試行回数をインクリメント(カウントされるのはログインIDが存在する場合のみ)
      if employee.login_attempts >= 5 # ログイン試行回数が5回以上の場合、アカウントをロックする
        employee.update(enable: Employee.enables[:inactive]) # ここでアカウントを非アクティブに更新するコードを追加する必要があります。
        redirect_to login_url, alert: 'ログイン試行回数が上限に達したため、アカウントがロックされました。'
        return
      end
    end
    flash.now[:alert] = 'ログインIDまたはパスワードが間違っています。' # エラーメッセージを設定
    render :new
  end  
end
