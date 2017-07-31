require 'rails_helper'

RSpec.describe Course, type: :model do
  it "should have many lessons" do
    c = Course.reflect_on_association(:lessons)
    expect(c.macro).to eq(:has_many)
  end
end
