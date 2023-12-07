class WorkSchedulesController < ApplicationController
  def index
    if params[:file].present?
      @work_schedules = WorkSchedule.read_from_file(params[:file])
      # ここでは @work_schedules をビューで表示するだけで、DBには保存しない
    end
  end

  def import
    # ここで実際にデータをDBに保存
    WorkSchedule.import(@work_schedules)
    redirect_to work_schedules_path, notice: "勤務表のインポートに成功しました。"
  end
end
