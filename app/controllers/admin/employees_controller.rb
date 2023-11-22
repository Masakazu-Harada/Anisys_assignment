class Admin::EmployeesController < ApplicationController
  def index
    @q = Employee.ransack(params[:q])
    # 非アクティブな従業員を除外する
    @employees = @q.result.where(enable: :active).includes(:branch, :department, :boss).order(id: :asc)
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to admin_employee_url(@employee), notice: '従業員情報を登録しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update(employee_params)
      redirect_to admin_employee_url(@employee), notice: '従業員情報を更新しました。'
    else
      @supervisors = Employee.supervisors # スコープを使用して上級役職の従業員を取得
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy #従業員レコードを削除せず、有効フラグを無効にする実装
    @employee = Employee.find(params[:id])

    # employeeモデルのdeactivate!メソッドを呼び出す
    if @employee.deactivate!
      redirect_to admin_employees_url, notice: "#{@employee.full_name}さんを無効化しました。"
    else
      redirect_to admin_employees_url, alert: "他にシステム管理者がいないため、#{@employee.full_name}さんを無効化できません。"
    end
  end


  private

  def employee_params
    params.require(:employee).permit(
      :full_name, :kana_name, :admin, :log_in_id, :password, 
      :password_confirmation, :email, :branch_id, :department_id, 
      :boss_id, :position, :id, role_ids: []
    )
  end

  def require_admin
    redirect_to root_url unless current_employee.has_role?('sysadmin')
  end
end

