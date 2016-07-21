require 'rails_helper'

RSpec.describe Video, type: :model do

  it "has a valid factory" do
       expect(create(:video)).to be_valid
  end

  it "is invalid without a video name"  do
   expect( build(:video, name: nil) ).not_to be_valid
  end

  it "is invalid without a youtube id" do
    expect(build(:video,youtube_id: nil)).not_to be_valid
  end

end
