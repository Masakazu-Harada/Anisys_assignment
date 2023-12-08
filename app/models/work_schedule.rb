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
        actual_work_hours: sheet.cell('E', row).to_s,  # 変更部分
        over_time: sheet.cell('F', row).to_s,
        attendance_status: sheet.cell('G', row).to_s,
        total_work_hours: total_work_hours,
        total_overtime_hours: total_overtime_hours,
        paid_leave_days: total_paid_leave_days,
        absent_days: total_absent_days,
        total_work_days: total_working_days
      )
    end

    work_schedules
  end


  # 読み込んだデータをデータベースに保存するためのメソッド
  def self.import(work_schedules)
    work_schedules.each do |schedule|
      # 重複するデータがないかチェックする
      # 例: 同じ日付と従業員IDのデータが既に存在するか
      next if exists?(employee_id: schedule.employee_id, date: schedule.date)

      # データベースに保存する
      schedule.save
    end
  end
end
