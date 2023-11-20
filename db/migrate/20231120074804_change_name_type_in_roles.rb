class ChangeNameTypeInRoles < ActiveRecord::Migration[7.0]
  def up
    # カラムの型を変更
    change_column :roles, :name, 'integer USING CAST(name AS integer)'
  end

  def down
    change_column :roles, :name, :string
  end
end
