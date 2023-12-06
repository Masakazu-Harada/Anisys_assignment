class AddAttendanceStatusAndActualWorkHoursToWorkSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :work_schedules, :attendance_status, :string
    add_column :work_schedules, :actual_work_hours, :float
  end
end
