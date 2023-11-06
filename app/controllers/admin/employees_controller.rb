class Admin::EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to admin_employee_url(@employee), notice: '従業員:#{@employee.full_name}を登録しました。'
    else
      render :new
    end
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update(employee_params)
      redirect_to admin_employee_url(@employee), notice: '従業員:#{@employee.full_name}情報を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to admin_employees_url, notice: '従業員:#{@employee.full_name}情報を削除しました。'
  end

  private

  def employee_params
    params.require(:employee).permit(:full_name, :kana_name, :admin, :log_in_id, :password, :password_confirmation, :email) 
  end
end
