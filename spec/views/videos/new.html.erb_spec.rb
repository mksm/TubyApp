require 'rails_helper'

RSpec.describe "videos/new", type: :view do
  before(:each) do
    assign(:video, Video.new(
      :name => "MyString",
      :youtube_id => "MyString"
    ))
  end

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", videos_path, "post" do

      assert_select "input#video_name[name=?]", "video[name]"

      assert_select "input#video_youtube_id[name=?]", "video[youtube_id]"
    end
  end
end
