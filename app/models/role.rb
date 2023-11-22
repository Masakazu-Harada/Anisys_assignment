class Role < ApplicationRecord
  # employee_rolesの中間モデルを通してemployeesテーブルと関連付け
  has_many :employee_roles, dependent: :destroy
  has_many :employees, through: :employee_roles
end
