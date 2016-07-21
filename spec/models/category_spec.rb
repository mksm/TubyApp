require 'rails_helper'

RSpec.describe Category, type: :model do

  it "has a valid factory" do
    expect(create(:category)).to be_valid
  end

  it "is invalid without a name"  do
    expect( build(:category, name: nil) ).not_to be_valid
  end
end
