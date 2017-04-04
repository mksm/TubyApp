require 'rails_helper'

RSpec.describe Video, type: :model do

  it "is invalid without a video name"  do
   expect( build(:video, name: nil) ).not_to be_valid
  end

  it "is invalid without a youtube id" do
    expect(build(:video,youtube_id: nil)).not_to be_valid
  end

  it "is invalid without a channel" do
    expect(build(:video,channel: nil)).not_to be_valid
  end

  context "a youtube id already exists" do
    let!(:v1) { FactoryGirl.create(:video, youtube_id: "abcd12345") }

    it { expect( FactoryGirl.build(:video, youtube_id: "abcd12345") ).not_to be_valid }
  end
end
