class Assignment < ApplicationRecord
  has_many :user_assignments
  belongs_to :lesson
  has_many :users, through: :user_assignments
end
