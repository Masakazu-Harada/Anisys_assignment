class Employee < ApplicationRecord
  has_secure_password #パスワードのハッシュ化
  
  belongs_to :branch
  belongs_to :department
  belongs_to :boss

  enum admin: { general: 0, admin: 1 } #admin権限をenumで管理する　0:一般, 1:管理者
  enum enable: { inactive: 0, active: 1 } #社員の退職状況をenumで管理する　0:無効（退職）, 1:有効（在籍中）
end
