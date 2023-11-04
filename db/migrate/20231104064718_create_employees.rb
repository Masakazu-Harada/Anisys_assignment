class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.integer :staff_number, null: false # 社員番号
      t.string :full_name, null: false # 氏名
      t.string :kana_name, null: false # カナ
      t.string :log_in_id, null: false # ログインID
      t.string :password_digest, null: false # パスワード
      t.integer :admin, default: false # admin権限をenumで管理する　0:一般, 1:管理者
      t.integer :enable, default: true # 社員の退職状況をenumで管理する　0:無効（退職）, 1:有効（在籍中）
      t.string :email, null: false # メールアドレス
      t.datetime :pwup_day  # パスワード変更日
      t.references :branch, null: false, foreign_key: true  # 支店情報 外部キー  
      t.references :department, null: false, foreign_key: true  # 部署情報 外部キー
      t.references :boss, null: false, foreign_key: true # 上司情報 外部キー

      t.timestamps
    end
    add_index :employees, :staff_number, unique: true # 社員番号は一意
    add_index :employees, :log_in_id, unique: true # ログインIDは一意
    add_index :employees, :email, unique: true # メールアドレスは一意
  end
end
