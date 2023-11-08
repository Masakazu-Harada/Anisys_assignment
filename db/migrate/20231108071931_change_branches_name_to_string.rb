class ChangeBranchesNameToString < ActiveRecord::Migration[7.0]
  def up
    change_column :branches, :name, :string
  end

  def down
    change_column :branches, :name, :integer
  end
end

