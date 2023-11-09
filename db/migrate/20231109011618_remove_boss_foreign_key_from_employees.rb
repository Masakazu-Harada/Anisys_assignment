class RemoveBossForeignKeyFromEmployees < ActiveRecord::Migration[7.0]
  def change
    # employeesテーブルのboss_idカラムの外部キー制約を削除
    remove_foreign_key :employees, :bosses
    remove_index :employees, :boss_id
    remove_column :employees, :boss_id
  end
end
