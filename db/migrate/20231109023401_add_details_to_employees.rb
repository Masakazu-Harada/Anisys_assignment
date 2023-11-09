class AddDetailsToEmployees < ActiveRecord::Migration[7.0]
  def change
    # full_nameとkana_nameにlimit: 20を設定
    change_column :employees, :full_name, :string, limit: 20
    change_column :employees, :kana_name, :string, limit: 20

    # boss_idをinteger型で追加
    add_column :employees, :boss_id, :integer
  end
end
