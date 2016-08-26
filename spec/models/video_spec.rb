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
  
  describe "validations" do
    context "destroy dependent" do
      let!(:category) { create(:category, :videos => create_list(:video, 1)) }
      
      before(:each) { Category.first.destroy!; }
      
      xit { expect(Category.count).to eq 0 }
      xit { expect(Video.count).to eq 0 }
    end
  end
  
  context "a youtube id already exists" do
    let!(:v1) { create(:video, youtube_id: "abc123") } 
    
    it { expect( build(:video, youtube_id: "abc123") ).not_to be_valid }   
  end
end
