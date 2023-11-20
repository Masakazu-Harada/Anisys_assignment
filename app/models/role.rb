class Role < ApplicationRecord
  # employee_rolesの中間モデルを通してemployeesテーブルと関連付け
  has_many :employee_roles, dependent: :destroy
  has_many :employees, through: :employee_roles

  enum name: {
    system_administrator: 0, # システム管理者
    human_resources: 1, # 人事
    business_planning: 2, # 事業企画
    budget_management: 3, # 予算管理
    general_affairs: 4, # 総務
    accounting: 5, # 経理
    technical: 6, # 技術
    sales: 7, # 営業
    manufacturing: 8 # 製造
  }
end
