class RemoveStaffNumberFromEmployees < ActiveRecord::Migration[7.0]
  def change
    remove_column :employees, :staff_number, :integer
  end
end
