class User < ApplicationRecord
  has_many :user_assignments
  has_many :assignments, through: :user_assignments
end
