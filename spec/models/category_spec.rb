require 'rails_helper'

RSpec.describe Category, type: :model do

  it "is invalid without a name"  do
    expect( build(:category, name: nil) ).not_to be_valid
  end
end
