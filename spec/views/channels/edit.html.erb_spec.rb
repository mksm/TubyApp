require 'rails_helper'

RSpec.describe "channels/edit", type: :view do
  before(:each) do
    @channel = assign(:channel, Channel.create!(
      :name => "MyString",
      :youtube_id => "MyString"
    ))
  end

  it "renders the edit channel form" do
    render

    assert_select "form[action=?][method=?]", channel_path(@channel), "post" do

      assert_select "input#channel_name[name=?]", "channel[name]"

      assert_select "input#channel_youtube_id[name=?]", "channel[youtube_id]"
    end
  end
end
