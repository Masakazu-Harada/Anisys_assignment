class ChangeColumnToNull < ActiveRecord::Migration[7.0]
  def up
    change_column_null :employees, :staff_number, true
    change_column_null :employees, :full_name, true
    change_column_null :employees, :kana_name, true
    change_column_null :employees, :email, true
    change_column_null :employees, :branch_id, true
    change_column_null :employees, :department_id, true
    change_column_null :employees, :boss_id, true
  end

  def down
    change_column_null :employees, :staff_number, false
    change_column_null :employees, :full_name, false
    change_column_null :employees, :kana_name, false
    change_column_null :employees, :email, false
    change_column_null :employees, :branch_id, false
    change_column_null :employees, :department_id, false
    change_column_null :employees, :boss_id, false
  end
end
