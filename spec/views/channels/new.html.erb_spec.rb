require 'rails_helper'

RSpec.describe "channels/new", type: :view do
  before(:each) do
    assign(:channel, Channel.new(
      :name_en => "MyString",
      :name_ar => "سلسلة بلدي",
      :youtube_id => "MyString"
    ))
  end

  it "renders new channel form" do
    render

    assert_select "form[action=?][method=?]", channels_path, "post" do
      assert_select "input#channel_name_en[name=?]", "channel[name_en]"
      assert_select "input#channel_name_ar[name=?]", "channel[name_ar]"
      assert_select "input#channel_youtube_id[name=?]", "channel[youtube_id]"
    end
  end
end
