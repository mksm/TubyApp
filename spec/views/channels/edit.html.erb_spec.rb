require 'rails_helper'

RSpec.describe "channels/edit", type: :view do
  before(:each) do
    @channel = assign(:channel, Channel.create!(
      :name_en => "MyString",
      :name_ar => "سلسلة بلدي",
      :youtube_id => "MyString"
    ))
  end

  it "renders the edit channel form" do
    render

    assert_select "form[action=?][method=?]", channel_path(@channel), "post" do

      assert_select "input#channel_name_en[name=?]", "channel[name_en]"
      assert_select "input#channel_name_ar[name=?]", "channel[name_ar]"

      assert_select "input#channel_youtube_id[name=?]", "channel[youtube_id]"
    end
  end
  it "renders a delete channel button" do
    channelId = Channel.find_by_name("MyString").id
    render
    assert_select "a", :text => "Delete Channel", :count => 1
    assert_select "a[href=?]", "/channels/#{channelId}"
    assert_select "a[data-method=?]", "delete"
  end
end
