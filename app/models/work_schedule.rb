class WorkSchedule < ApplicationRecord
  belongs_to :employee

  def self.read_from_file(file)
    xlsx = Roo::Excelx.new(file.path)
    sheet = xlsx.sheet(0)

    employee_name = sheet.cell('E', 1)
    employee = Employee.find_by(full_name: employee_name)
    return [] unless employee

    total_work_hours = sheet.cell('G', 1).to_s
    total_overtime_hours = sheet.cell('I', 1).to_s
    total_paid_leave_days = sheet.cell('G', 2).to_s
    total_absent_days = sheet.cell('I', 2).to_s
    total_working_days = sheet.cell('G', 3).to_s

    work_schedules = []

    (6..36).each do |row|
      date = sheet.cell('A', row)
      next if date.nil?

      work_schedules << new(
        employee_id: employee.id,
        date: date,
        start_time: sheet.cell('B', row).to_s.split(' ').last,
        end_time: sheet.cell('C', row).to_s.split(' ').last,
        break_time: sheet.cell('D', row).to_s,
        work_time: sheet.cell('E', row).to_s,
        overtime: sheet.cell('F', row).to_s,
        attendance_status: sheet.cell('G', row).to_s,
        total_work_hours: total_work_hours,
        total_overtime_hours: total_overtime_hours,
        total_paid_leave_days: total_paid_leave_days,
        total_absent_days: total_absent_days,
        total_working_days: total_working_days
      )
    end

    work_schedules
  end
end
