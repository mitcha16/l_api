require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have many assignments" do
    u = User.reflect_on_association(:assignments)
    expect(u.macro).to eq(:has_many)
  end
end
