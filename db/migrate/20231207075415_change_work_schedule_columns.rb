class ChangeWorkScheduleColumns < ActiveRecord::Migration[6.0]
  def change
    change_column :work_schedules, :start_time, :string
    change_column :work_schedules, :end_time, :string
    change_column :work_schedules, :break_time, :string
    change_column :work_schedules, :over_time, :string
    change_column :work_schedules, :total_work_hours, :string
    change_column :work_schedules, :total_overtime_hours, :string
    change_column :work_schedules, :actual_work_hours, :string
  end
end
