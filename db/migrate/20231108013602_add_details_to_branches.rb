class AddDetailsToBranches < ActiveRecord::Migration[7.0]
  def change
    add_column :branches, :branch_type, :integer
    add_column :branches, :tel_number, :string
    add_column :branches, :fax_number, :string
    add_column :branches, :post_code, :string
    add_column :branches, :address1, :text
    add_column :branches, :address2, :text
  end
end
