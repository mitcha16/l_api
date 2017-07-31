require 'rails_helper'

RSpec.describe Lesson, type: :model do
  it "should belong to a course" do
    l = Lesson.reflect_on_association(:course)
    expect(l.macro).to eq(:belongs_to)
  end

  it "should have many assignments" do
    l = Lesson.reflect_on_association(:assignments)
    expect(l.macro).to eq(:has_many)
  end
end
