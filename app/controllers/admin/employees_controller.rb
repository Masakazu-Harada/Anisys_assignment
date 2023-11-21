class Admin::EmployeesController < ApplicationController
  before_action :set_supervisors, only: [:new, :create, :edit, :update]

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
    #higher_positions = Employee.positions.slice(:head, :manager, :officer, :president).values
    #@supervisors = Employee.where(position: higher_positions)
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to admin_employee_url(@employee), notice: '従業員情報を登録しました。'
    else
      binding.pry
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    #higher_positions = Employee.positions.slice(:head, :manager, :officer, :president).values
    #@supervisors = Employee.where(position: higher_positions)
  end

  def update
    @employee = Employee.find(params[:id])
    higher_positions = Employee.positions.slice(:head, :manager, :officer, :president).values
    @supervisors = Employee.where(position: higher_positions)
  
    if @employee.update(employee_params)
      redirect_to admin_employee_url(@employee), notice: '従業員情報を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy #従業員レコードを削除せず、有効フラグを無効にする実装
    @employee = Employee.find(params[:id])

    unless @employee.other_admin_exists?
      redirect_to admin_employees_url, alert: '他にシステム管理者がいないため、無効化できません。'
      return
    end
    
    if @employee.deactivate!
      redirect_to admin_employees_url, notice: "#{@employee.full_name}さんを無効化しました。"
    else
      redirect_to admin_employees_url, alert: '従業員の無効化に失敗しました。'
    end
  end

  #def destroy レコードを削除する実装の場合
    #@employee = Employee.find(params[:id])
    #@employee.destroy
    #redirect_to admin_employees_url, notice: '従業員情報を削除しました。'
  #end

  private

  def employee_params
    params.require(:employee).permit(
      :full_name, :kana_name, :admin, :log_in_id, :password, 
      :password_confirmation, :email, :branch_id, :department_id, 
      :boss_id, :position, :id, role_ids: []
    )
  end

  def require_admin
    redirect_to root_url unless current_employee.admin?
  end

  def set_supervisors
    higher_positions = Employee.positions.slice(:head, :manager, :officer, :president).values
    @supervisors = Employee.where(position: higher_positions)
  end
end

# Path: app/models/employee.rb
