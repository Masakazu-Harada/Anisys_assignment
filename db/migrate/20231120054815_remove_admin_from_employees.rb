class RemoveAdminFromEmployees < ActiveRecord::Migration[7.0]
  def change
    remove_column :employees, :admin, :integer
  end
end
