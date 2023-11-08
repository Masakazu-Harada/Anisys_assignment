class AddDetailsToBranches < ActiveRecord::Migration[7.0]
  def change
    add_column :branches, :branch_type, :integer, default: 0 #支店区分 enumで管理する 0:本店 1:工場
    add_column :branches, :tel_number, :string, limit: 15 #電話番号は15桁まで
    add_column :branches, :fax_number, :string, limit: 15 #FAX番号は15桁まで
    add_column :branches, :post_code, :string, limit: 8 #郵便番号は8桁まで
    add_column :branches, :address1, :text, limit: 50 #住所1は50文字まで
    add_column :branches, :address2, :text, limit: 50 #住所2も50文字まで
  end
end
