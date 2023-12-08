class WorkSchedulesController < ApplicationController
  def index
    # ファイルがアップロードされた場合の処理
    if params[:file].present?
      @work_schedules = WorkSchedule.read_from_file(params[:file])
      # ここでは @work_schedules をビューで表示するだけで、DBには保存しない
    else
      # ここで特定の従業員に絞り込むロジックが必要
      # 例: 現在のユーザー（従業員）に関連するデータのみを取得する
      @work_schedules = current_employee.work_schedules.order(date: :asc)
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
