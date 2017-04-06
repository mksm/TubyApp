require 'rails_helper'

RSpec.describe Channel, type: :model do
  it "has a valid factory" do
    expect( FactoryGirl.create(:channel) ).to be_valid
  end
  
  describe '#name' do
    context 'invalid' do
      subject { build(:channel, name: nil) }
      it { expect(subject).to_not be_valid }
    end
  end
  
  describe '#youtube_id' do
    context 'invalid' do
      subject { build(:channel, youtube_id: nil) }
      it { expect(subject).to_not be_valid }
    end
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
