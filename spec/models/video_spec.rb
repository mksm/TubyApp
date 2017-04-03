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
=begin
  describe "#upload_csv" do
    context "with a single video" do
      let!(:category) { create(:category) }

      before(:each) { @videos = Video.import_csv(fixture_csv.read) }

      it { expect(@videos.count).to eq 1 }
      it { expect(Video.count).to eq 0 }
    end

    context "with an invalid video for a category that doesnt exist" do
      before(:each) { @videos = Video.import_csv(fixture_csv.read) }

      it { expect(Video.count).to eq 0 }
      it { expect(@videos.count).to eq 1 }
      it { expect(@videos[0].valid?).to eq false }
    end

    context "with field spacing" do
      let!(:category) { create(:category) }

      before(:each) { @videos = Video.import_csv(fixture_csv("videos_3_spaced_fields.csv").read) }

      it { expect(Video.count).to eq 0 }
      it { expect(@videos.count).to eq 1 }
      xit { expect(@videos[0].valid?).to eq true }
      xit { expect(@videos[0].name).to eq "Minions Home alone" }
      xit { expect(@videos[0].youtube_id).to eq "KKYXpcbdgFc" }
      xit { expect(@videos[0].category_id).to eq 1 }

    end
  end
=end
end
