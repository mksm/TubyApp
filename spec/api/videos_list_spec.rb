require 'rails_helper'

feature 'videos list' do

  context "no category_ids specified" do    
    before(:each) { get "/api/videos.json", params: {page: 1} }
    
    it { expect(response.status).to eq 406 }
  end
  
  context "no page specified" do    
    before(:each) { get "/api/videos.json", params: {category_ids: "1"} }
    
    it { expect(response.status).to eq 406 }
  end

  context "no videos" do    
    before(:each) { get "/api/videos.json", params: {category_ids: "1", page: 1} }
    
    it { expect(response.status).to eq 200 }
    it { expect(response.body).to eq "[]"}
  end

  context "single video" do
    let(:c1) { create :category }
    let!(:v1) { create(:video, name: "Mickey", youtube_id: "abc1234", category: c1) }
    
    let(:category_ids) { [c1.id] }
    
    before(:each) { get "/api/videos.json", params: {category_ids: category_ids.join(","), page: 1} }
    
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
    
    before(:each) { get "/api/videos.json", params: {category_ids: category_ids.join(","), page: 1} }
    
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
    
    before(:each) { get "/api/videos.json", params: {q: "ickey", category_ids: category_ids.join(","), page: 1} }
    
    it { expect(response.status).to eq 200 }
    
    it { expect(response.body).to have_json_size(1).at_path("/") }    

    it { expect(parse_json(response.body, "0/id")).to eq v1.id }
    it { expect(parse_json(response.body, "0/name")).to eq "Mickey Mouse" }
    it { expect(parse_json(response.body, "0/youtube_id")).to eq "abc1234" }
    it { expect(parse_json(response.body, "0/category_id")).to eq c1.id }    
    it { expect(response.body).to have_json_type(String).at_path("0/created_at") }    
  end

  context "single video specifying lower case partial name" do
    let(:c1) { create :category }
    let!(:v1) { create(:video, name: "Mickey Mouse", youtube_id: "abc1234", category: c1) }
    let!(:v2) { create(:video, name: "Donald", youtube_id: "zxy1234", category: c1) }

    let(:category_ids) { [c1.id] }

    before(:each) { get "/api/videos.json", params: {q: "dona", category_ids: category_ids.join(","), page: 1} }

    it { expect(response.status).to eq 200 }

    it { expect(response.body).to have_json_size(1).at_path("/") }

    it { expect(parse_json(response.body, "0/id")).to eq v2.id }
    it { expect(parse_json(response.body, "0/name")).to eq "Donald" }
    it { expect(parse_json(response.body, "0/youtube_id")).to eq "zxy1234" }
    it { expect(parse_json(response.body, "0/category_id")).to eq c1.id }
    it { expect(response.body).to have_json_type(String).at_path("0/created_at") }
  end

  context "no videos specifying partial name" do
    let(:c1) { create :category }
    let!(:v1) { create(:video, name: "Mickey Mouse", youtube_id: "abc1234", category: c1) }
    let!(:v2) { create(:video, name: "Donald", youtube_id: "zxy1234", category: c1) }
    
    let(:category_ids) { [c1.id] }
    
    before(:each) { get "/api/videos.json", params: {q: "Stelian", category_ids: category_ids.join(","), page: 1} }
    
    it { expect(response.status).to eq 200 }
    it { expect(response.body).to have_json_size(0).at_path("/") }    
  end
  
  context "second page of videos using default page size" do
    let!(:c1) { create(:category, videos: create_list(:video, 51)) }
    
    let(:category_ids) { [c1.id] }
    
    before(:each) { get "/api/videos.json", params: {category_ids: category_ids.join(","), page: 2} }
    
    it { expect(response.status).to eq 200 }
    it { expect(response.body).to have_json_size(1).at_path("/") }    
  end
  
  context "second page of videos using specified page size" do
    let!(:c1) { create(:category, videos: create_list(:video, 11)) }
    
    let(:category_ids) { [c1.id] }
    
    before(:each) { get "/api/videos.json", params: {category_ids: category_ids.join(","), page: 2, page_size: 10} }
    
    it { expect(response.status).to eq 200 }
    it { expect(response.body).to have_json_size(1).at_path("/") }    
  end

  context "excluded videos" do
    let(:c1) { create :category }
    let!(:v1) { create(:video, name: "Mickey Mouse", youtube_id: "abc1234", category: c1) }
    let!(:v2) { create(:video, name: "Donald", youtube_id: "zxy1234", category: c1) }

    let(:category_ids) { [c1.id] }
    let(:excluded_youtube_ids) { [v1.youtube_id] }

    before(:each) { get "/api/videos.json", params: {category_ids: category_ids.join(","), page: 1, excluded_youtube_ids:excluded_youtube_ids.join(",") } }

    it { expect(response.status).to eq 200 }

    it { expect(response.body).to have_json_size(1).at_path("/") }

    it { expect(parse_json(response.body, "0/id")).to eq v2.id }
    it { expect(parse_json(response.body, "0/name")).to eq "Donald" }
    it { expect(parse_json(response.body, "0/youtube_id")).to eq "zxy1234" }
    it { expect(parse_json(response.body, "0/category_id")).to eq c1.id }
    it { expect(response.body).to have_json_type(String).at_path("0/created_at") }
  end

  context "included videos" do
    let(:c1) { create :category }
    let!(:v1) { create(:video, name: "Mickey Mouse", youtube_id: "abc1234", category: c1) }
    let!(:v2) { create(:video, name: "Donald", youtube_id: "zxy1234", category: c1) }

    let(:c2) { create :category }
    let!(:v3) { create(:video, name: "Mickey Mouse2", youtube_id: "abc12342", category: c2) }
    let!(:v4) { create(:video, name: "Donald2", youtube_id: "zxy12342", category: c2) }

    let(:category_ids) { [c1.id] }
    let(:included_youtube_ids) { [v3.youtube_id] }

    before(:each) { get "/api/videos.json", params: {category_ids: category_ids.join(","), page: 1, included_youtube_ids: included_youtube_ids.join(",")} }

    it { expect(response.status).to eq 200 }

    it { expect(response.body).to have_json_size(3).at_path("/") }

    # first video from 1st category
    it { expect(parse_json(response.body, "0/id")).to eq v1.id }
    it { expect(parse_json(response.body, "0/name")).to eq "Mickey Mouse" }
    it { expect(parse_json(response.body, "0/youtube_id")).to eq "abc1234" }
    it { expect(parse_json(response.body, "0/category_id")).to eq c1.id }
    it { expect(response.body).to have_json_type(String).at_path("0/created_at") }

    # 2nd video from 1st category
    it { expect(parse_json(response.body, "1/id")).to eq v2.id }
    it { expect(parse_json(response.body, "1/name")).to eq "Donald" }
    it { expect(parse_json(response.body, "1/youtube_id")).to eq "zxy1234" }
    it { expect(parse_json(response.body, "1/category_id")).to eq c1.id }
    it { expect(response.body).to have_json_type(String).at_path("1/created_at") }

    # 1std video from 2nd category
    it { expect(parse_json(response.body, "2/id")).to eq v3.id }
    it { expect(parse_json(response.body, "2/name")).to eq "Mickey Mouse2" }
    it { expect(parse_json(response.body, "2/youtube_id")).to eq "abc12342" }
    it { expect(parse_json(response.body, "2/category_id")).to eq c2.id }
    it { expect(response.body).to have_json_type(String).at_path("2/created_at") }
  end


  context "included videos pagination" do
    let(:c1) { create :category }
    let!(:v1) { create(:video, name: "Mickey Mouse", youtube_id: "abc1234", category: c1) }
    let!(:v2) { create(:video, name: "Donald", youtube_id: "zxy1234", category: c1) }

    let(:c2) { create :category }
    let!(:v3) { create(:video, name: "Mickey Mouse2", youtube_id: "abc12342", category: c2) }
    let!(:v4) { create(:video, name: "Donald2", youtube_id: "zxy12342", category: c2) }

    let(:category_ids) { [c1.id] }
    let(:included_youtube_ids) { [v3.youtube_id] }

    before (:each){ get "/api/videos.json", params: {category_ids: category_ids.join(","), page: 2, page_size: 2, included_youtube_ids: included_youtube_ids.join(",")}}

    it { expect(response.status).to eq 200 }

    it { expect(response.body).to have_json_size(1).at_path("/") }

    # 1std video from 2nd category
    it { expect(parse_json(response.body, "0/id")).to eq v3.id }
    it { expect(parse_json(response.body, "0/name")).to eq "Mickey Mouse2" }
    it { expect(parse_json(response.body, "0/youtube_id")).to eq "abc12342" }
    it { expect(parse_json(response.body, "0/category_id")).to eq c2.id }
    it { expect(response.body).to have_json_type(String).at_path("0/created_at") }

  end

  context "order videos by date added" do
    let(:c1) { create :category }
    let(:c2) { create :category }

    let!(:v1) { create(:video, name: "Mickey Mouse", youtube_id: "abc1234", category: c1) }
    let!(:v3) { create(:video, name: "Mickey Mouse2", youtube_id: "abc12342", category: c2) }
    let!(:v2) { create(:video, name: "Donald", youtube_id: "zxy1234", category: c1) }
    let!(:v4) { create(:video, name: "Donald2", youtube_id: "zxy12342", category: c2) }

    let(:category_ids) { [c1.id,c2.id] }

    before(:each) { get "/api/videos.json", params: {category_ids: category_ids.join(","), page: 1} }

    it { expect(response.status).to eq 200 }

    it { expect(response.body).to have_json_size(4).at_path("/") }

    # first video
    it { expect(parse_json(response.body, "0/id")).to eq v1.id }

    # 2nd video
    it { expect(parse_json(response.body, "1/id")).to eq v3.id }

    # 3rd video
    it { expect(parse_json(response.body, "2/id")).to eq v2.id }

    # 4th video
    it { expect(parse_json(response.body, "3/id")).to eq v4.id }
  end

  context "order filtered videos by date added" do
    let(:c1) { create :category }
    let(:c2) { create :category }

    let!(:v1) { create(:video, name: "Mickey Mouse", youtube_id: "abc1234", category: c1) }
    let!(:v3) { create(:video, name: "Mickey Mouse2", youtube_id: "abc12342", category: c2) }
    let!(:v2) { create(:video, name: "Donald", youtube_id: "zxy1234", category: c1) }
    let!(:v4) { create(:video, name: "Donald2", youtube_id: "zxy12342", category: c2) }

    let(:category_ids) { [c2.id] }
    let(:included_youtube_ids) { [v2.youtube_id] }

    before(:each) { get "/api/videos.json", params: {category_ids: category_ids.join(","), included_youtube_ids: included_youtube_ids.join(","),page: 1} }

    it { expect(response.status).to eq 200 }

    it { expect(response.body).to have_json_size(3).at_path("/") }

    # first video
    it { expect(parse_json(response.body, "0/id")).to eq v3.id }

    # 2nd video
    it { expect(parse_json(response.body, "1/id")).to eq v2.id }

    # 3rd video
    it { expect(parse_json(response.body, "2/id")).to eq v4.id }
  end


end