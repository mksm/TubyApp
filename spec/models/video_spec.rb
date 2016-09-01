require 'rails_helper'

RSpec.describe Video, type: :model do
  
  it "is invalid without a video name"  do
   expect( build(:video, name: nil) ).not_to be_valid
  end

  it "is invalid without a youtube id" do
    expect(build(:video,youtube_id: nil)).not_to be_valid
  end

  it "is invalid without a category" do
    expect(build(:video,category: nil)).not_to be_valid
  end
  
  context "a youtube id already exists" do
    let!(:v1) { create(:video, youtube_id: "abc123") } 
    
    it { expect( build(:video, youtube_id: "abc123") ).not_to be_valid }   
  end
  
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
  end
end
