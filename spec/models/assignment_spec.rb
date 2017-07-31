require 'rails_helper'

RSpec.describe Assignment, type: :model do
  it "should belong to a lesson" do
    a = Assignment.reflect_on_association(:lesson)
    expect(a.macro).to eq(:belongs_to)
  end

  it "should have many users" do
    a = Assignment.reflect_on_association(:users)
    expect(a.macro).to eq(:has_many)
  end
end
