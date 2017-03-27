require 'rails_helper'

RSpec.describe "channels/index", type: :view do
  before(:each) do
    assign(:channels, [
      Channel.create!(
        :name => "Name",
        :youtube_id => "Youtube"
      ),
      Channel.create!(
        :name => "Name",
        :youtube_id => "Youtube"
      )
    ])
  end

  it "renders a list of channels" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Youtube".to_s, :count => 2
  end
end
