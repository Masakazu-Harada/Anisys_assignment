class DropRoles < ActiveRecord::Migration[7.0]
  def up
    drop_table :roles
  end

  def down
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
  end
end
