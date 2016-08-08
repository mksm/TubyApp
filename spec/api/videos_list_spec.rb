require 'rails_helper'

feature 'videos list' do

  context "no category_ids specified" do    
    before(:each) { get "/api/videos.json" } 
    
    it { expect(response.status).to eq 406 }
  end

  context "no videos" do    
    before(:each) { get "/api/videos.json?category_ids=1" } 
    
    it { expect(response.status).to eq 200 }
    it { expect(response.body).to eq "[]"}
  end

  context "single video" do
    let(:c1) { create :category }
    let!(:v1) { create(:video, name: "Mickey", youtube_id: "abc1234", category: c1) }
    
    let(:category_ids) { [c1.id] }
    
    before(:each) { get "/api/videos.json", params: {category_ids: category_ids.join(",")} }
    
    it { expect(response.status).to eq 200 }
    it { expect(response.body).to eq "[{\"id\":#{v1.id},\"name\":\"Mickey\",\"youtube_id\":\"abc1234\",\"category_id\":#{c1.id}}]"}
  end
  
  context "from single category" do
    let(:c1) { create :category }
    let!(:v1) { create(:video, name: "Mickey", youtube_id: "abc1234", category: c1) }
    
    let(:c2) { create :category }
    let!(:v2) { create(:video, name: "Donald", youtube_id: "def1234", category: c2) }
    
    let(:category_ids) { [c1.id] }
    
    before(:each) { get "/api/videos.json", params: {category_ids: category_ids.join(",")} } 
    
    it { expect(response.status).to eq 200 }
    it { expect(response.body).to eq "[{\"id\":#{v1.id},\"name\":\"Mickey\",\"youtube_id\":\"abc1234\",\"category_id\":#{c1.id}}]"}
  end
  
end