class Employee < ApplicationRecord
  has_secure_password #パスワードのハッシュ化
  
  validates :full_name, presence: true, length: { maximum: 20 } #氏名の必須入力と文字数制限
  validates :log_in_id, presence: true, uniqueness: true, length: { maximum: 50 } #ログインIDの必須入力と一意性と文字数制限
  validates :email, presence: true, uniqueness: true #メールアドレスの必須入力と一意性


  belongs_to :branch, optional: true #optional: trueでnilを許可する
  belongs_to :department, optional: true  #optional: trueでnilを許可する
  
  belongs_to :boss, class_name: 'Employee', foreign_key: 'boss_id', optional: true #上司の従業員情報を取得するためのアソシエーション
  has_many :team_members, class_name: 'Employee', foreign_key: 'boss_id' #部下の従業員情報を取得するためのアソシエーション

  enum admin: { general: 0, admin: 1 } #admin権限をenumで管理する　0:一般, 1:管理者
  enum enable: { inactive: 0, active: 1 } #社員の退職状況をenumで管理する　0:無効（退職）, 1:有効（在籍中）
  enum position: {
    staff: 0, #一般社員
    chief: 1, #係長
    head: 2, #課長
    manager: 3, #部長
  }
end
