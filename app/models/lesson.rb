class Lesson < ApplicationRecord
  has_many :assignments
  belongs_to :course
end
