require 'rails_helper'

feature 'channels list' do

  before(:each) do
    allow_any_instance_of(Api::BaseController).to receive(:access_id_and_secret_key).and_return(["ABC123", "DEF456"])
    ApiAuthHelpers.set_credentials("ABC123", "DEF456")
  end

  context "no channels" do
    before(:each) { get "/api/channels.json" }

    it { expect(response.status).to eq 200 }
    it { expect(response.body).to eq "[]"}
  end

  context "single empty channel" do
    let!(:c1) { create(:channel, name: "Cartoons", youtube_id: "channelabc123") }

    before(:each) { get "/api/channels.json" }

    it { expect(response.status).to eq 200 }
    it { expect(parse_json(response.body, "0/id")).to eq c1.id }
    it { expect(parse_json(response.body, "0/name")).to eq "Cartoons" }
    it { expect(parse_json(response.body, "0/videos_count")).to eq 0 }
    it { expect(parse_json(response.body, "0/channel_image_url")).to be nil }
    it { expect(response.body).to have_json_type(String).at_path("0/created_at") }
  end

  context "single channel with one video" do
    let(:c1) { create(:channel, name: "Cartoons", youtube_id: "channelabc123") }
    let!(:v1) { create(:video, channel: c1, youtube_id: "abc123")}

    before(:each) { get "/api/channels.json" }

    it { expect(response.status).to eq 200 }
    it { expect(parse_json(response.body, "0/id")).to eq c1.id }
    it { expect(parse_json(response.body, "0/name")).to eq "Cartoons" }
    it { expect(parse_json(response.body, "0/videos_count")).to eq 1 }
    it { expect(parse_json(response.body, "0/channel_image_url")).to eq "http://img.youtube.com/vi/abc123/0.jpg" }
    it { expect(response.body).to have_json_type(String).at_path("0/created_at") }
  end

end
