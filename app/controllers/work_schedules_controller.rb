class WorkSchedulesController < ApplicationController
  def index
    # データベースから最新の勤務スケジュールデータを取得
    @work_schedules = WorkSchedule.all.order(date: :asc)

    # ファイルがアップロードされた場合の処理（オプション）
    if params[:file].present?
      @work_schedules = WorkSchedule.read_from_file(params[:file])
      # ここでは @work_schedules をビューで表示するだけで、DBには保存しない
    end
  end

  def import
    if params[:file].present?
      work_schedules = WorkSchedule.read_from_file(params[:file])

      WorkSchedule.import(work_schedules)
      redirect_to work_schedules_path, notice: "勤務表のインポートに成功しました。"
    else
      redirect_to work_schedules_path, alert: "ファイルを選択してください。"
    end
  end
end
