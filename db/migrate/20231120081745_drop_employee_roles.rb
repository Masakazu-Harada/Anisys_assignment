class DropEmployeeRoles < ActiveRecord::Migration[7.0]
  def up
    drop_table :employee_roles
  end

  def down
    # 必要に応じて、テーブルを再作成するコードを記述
  end
end
