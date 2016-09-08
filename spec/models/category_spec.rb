require 'rails_helper'

RSpec.describe Category, type: :model do

  describe "#videos" do
    context "destroy dependent" do
      let!(:category) { create(:category, :videos => create_list(:video, 1)) }
      
      before(:each) { Category.first.destroy!; }
      
      xit { expect(Category.count).to eq 0 }
      xit { expect(Video.count).to eq 0 }
    end
  end
  
  describe "#category_image_url" do
    context "no videos" do
      subject!(:category) { create(:category, videos: []) }
      it { expect(subject.category_image_url).to be nil }
    end
    
    context "single video" do
      subject!(:category) { create(:category) }
      let!(:video) { create(:video, youtube_id: "abc123", category: category)}
      it { expect(subject.category_image_url).to eq "http://img.youtube.com/vi/abc123/0.jpg" }
    end
  end


  it "is invalid without a name"  do
    expect( build(:category, name: nil) ).not_to be_valid
  end
  
end
