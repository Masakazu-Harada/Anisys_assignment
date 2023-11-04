class CreateBosses < ActiveRecord::Migration[7.0]
  def change
    create_table :bosses do |t|
      t.string :name # 上司名

      t.timestamps
    end
  end
end
