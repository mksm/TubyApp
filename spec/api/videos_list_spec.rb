require 'rails_helper'

feature 'videos list' do

  context "no videos" do    
    before(:each) { get "/api/videos.json" } 
    
    it { expect(response.status).to eq 200 }
    it { expect(response.body).to eq "[]"}
  end

  context "single video" do
    let(:c1) { create :category }
    let!(:v1) { create(:video, name: "Mickey", youtube_id: "abc1234", category: c1) }
    
    before(:each) { get "/api/videos.json" } 
    
    it { expect(response.status).to eq 200 }
    it { expect(response.body).to eq "[{\"id\":1,\"name\":\"Mickey\",\"youtube_id\":\"abc1234\",\"category_id\":1}]"}
  end
  
end