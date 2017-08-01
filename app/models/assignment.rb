class Assignment < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  before_create :add_assignees_count

  private
  def add_assignees_count
    if self.lesson
      lesson = self.lesson
      lesson.update_attribute(:assignees_count, (lesson.assignees_count + 1) )
    end
  end
end
