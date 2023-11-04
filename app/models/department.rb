class Department < ApplicationRecord
  has_many :employees # 1対多の関係を表現
end
