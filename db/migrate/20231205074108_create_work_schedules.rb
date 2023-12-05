class CreateWorkSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :work_schedules do |t|

      t.references :employee, null: false, foreign_key: true
      t.date :date, null: false
      t.time :start_time
      t.time :end_time
      t.integer :break_time
      t.integer :over_time

      # 集計用のカラム
      t.integer :total_work_days
      t.integer :absent_days
      t.integer :paid_leave_days
      t.float :total_work_hours
      t.float :total_overtime_hours

      t.timestamps
    end
  end
end
