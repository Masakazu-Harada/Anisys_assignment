class Employee < ApplicationRecord
  belongs_to :branch
  belongs_to :department
  belongs_to :boss
end
