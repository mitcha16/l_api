class User < ApplicationRecord
  has_many :assignments, :foreign_key => 'assignee_id'
end
