require 'rails_helper'

RSpec.describe Channel, type: :model do
  it "has a valid factory" do
    expect( FactoryGirl.create(:channel) ).to be_valid
  end
  it "is invalid without a channel name" do
    expect( build(:channel, name: nil) ).not_to be_valid
  end
  it "is invalid without a youtube_id" do
    expect( build(:channel, youtube_id: nil) ).not_to be_valid
  end
  it "has a valid videos counter method" do
    channel = FactoryGirl.create(:channel)
    first_video = FactoryGirl.create(:video, channel_id: channel.id)
    second_video = FactoryGirl.create(:video, channel_id: channel.id)
    expect(channel.videos.count).to eq(2)
  end
  it "videos are not counted after destroy" do
    channel = FactoryGirl.create(:channel)
    first_video = FactoryGirl.create(:video, channel_id: channel.id)
    second_video = FactoryGirl.create(:video, channel_id: channel.id)
    second_video.destroy
    expect(channel.videos.count).to eq(1)
  end
end
