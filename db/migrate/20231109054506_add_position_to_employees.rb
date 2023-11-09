class AddPositionToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :position, :integer, default: 0, null: false #役職をenumで管理する　
  end
end
