class AddForeignKeyToEmployeeRoles < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :employee_roles, :roles
  end
end
