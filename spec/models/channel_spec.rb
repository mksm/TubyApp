require 'rails_helper'

RSpec.describe Channel, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:channel).should be_valid
  end
  it "is invalid without a channel name" do
    expect( build(:channel, name: nil) ).not_to be_valid
  end
  it "is invalid without a youtube_id" do
    expect( build(:channel, youtube_id: nil) ).not_to be_valid
  end
end
