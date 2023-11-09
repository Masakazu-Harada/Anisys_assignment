class DropBossesTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :bosses
  end

  def down
    create_table :bosses do |t|
      t.string :name
    end
  end
end
