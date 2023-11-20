class AddRoleIdToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :role_id, :bigint
  end
end
