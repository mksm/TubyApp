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
    it { expect(parse_json(response.body, "0/id")).to eq v1.id }
    it { expect(parse_json(response.body, "0/name")).to eq "Mickey" }
    it { expect(parse_json(response.body, "0/youtube_id")).to eq "abc1234" }
    it { expect(parse_json(response.body, "0/category_id")).to eq c1.id }    
    it { expect(response.body).to have_json_type(String).at_path("0/created_at") }    
       
  end
  
  context "from single category" do
    let(:c1) { create :category }
    let!(:v1) { create(:video, name: "Mickey", youtube_id: "abc1234", category: c1) }
    
    let(:c2) { create :category }
    let!(:v2) { create(:video, name: "Donald", youtube_id: "def1234", category: c2) }
    
    let(:category_ids) { [c1.id] }
    
    before(:each) { get "/api/videos.json", params: {category_ids: category_ids.join(",")} } 
    
    it { expect(response.status).to eq 200 }
    
    it { expect(parse_json(response.body, "0/id")).to eq v1.id }
    it { expect(parse_json(response.body, "0/name")).to eq "Mickey" }
    it { expect(parse_json(response.body, "0/youtube_id")).to eq "abc1234" }
    it { expect(parse_json(response.body, "0/category_id")).to eq c1.id }    
    it { expect(response.body).to have_json_type(String).at_path("0/created_at") }  
  end
  
  context "single video specifying partial name" do
    let(:c1) { create :category }
    let!(:v1) { create(:video, name: "Mickey Mouse", youtube_id: "abc1234", category: c1) }
    let!(:v2) { create(:video, name: "Donald", youtube_id: "zxy1234", category: c1) }
    
    let(:category_ids) { [c1.id] }
    
    before(:each) { get "/api/videos.json", params: {q: "ickey", category_ids: category_ids.join(",")} }
    
    it { expect(response.status).to eq 200 }
    
    it { expect(response.body).to have_json_size(1).at_path("/") }    

    it { expect(parse_json(response.body, "0/id")).to eq v1.id }
    it { expect(parse_json(response.body, "0/name")).to eq "Mickey Mouse" }
    it { expect(parse_json(response.body, "0/youtube_id")).to eq "abc1234" }
    it { expect(parse_json(response.body, "0/category_id")).to eq c1.id }    
    it { expect(response.body).to have_json_type(String).at_path("0/created_at") }    
  end
  
  context "no videos specifying partial name" do
    let(:c1) { create :category }
    let!(:v1) { create(:video, name: "Mickey Mouse", youtube_id: "abc1234", category: c1) }
    let!(:v2) { create(:video, name: "Donald", youtube_id: "zxy1234", category: c1) }
    
    let(:category_ids) { [c1.id] }
    
    before(:each) { get "/api/videos.json", params: {q: "Stelian", category_ids: category_ids.join(",")} }
    
    it { expect(response.status).to eq 200 }
    it { expect(response.body).to have_json_size(0).at_path("/") }    
  end
  
end