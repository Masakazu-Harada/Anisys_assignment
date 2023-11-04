class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :name # 支店名

      t.timestamps
    end
  end
end
