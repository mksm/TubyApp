require 'rails_helper'

RSpec.describe "channels/index", type: :view do
  before(:each) do
    assign(:channels, [
      Channel.create!(
        :name_en => "Name1",
        :name_ar => "1 اسم",
        :youtube_id => "Youtube1"
      ),
      Channel.create!(
        :name_en => "Name2",
        :name_ar => "2 اسم",
        :youtube_id => "Youtube2"
      )
    ])
  end

  it "renders a list of channels" do
    render
    assert_select "tr>td", :text => "Name1".to_s, :count => 1
    assert_select "tr>td", :text => "1 اسم".to_s, :count => 1
    assert_select "tr>td", :text => "Youtube1".to_s, :count => 1
    assert_select "tr>td", :text => "Name2".to_s, :count => 1
    assert_select "tr>td", :text => "2 اسم".to_s, :count => 1
    assert_select "tr>td", :text => "Youtube2".to_s, :count => 1
  end
  it "renders a link to each channel edit form" do
    firstId = Channel.find_by(name:"Name1").id
    secondId = Channel.find_by(name:"Name2").id
    render
    assert_select "tr>td>a[href=?]", "/channels/#{firstId}/edit"
    assert_select "tr>td>a[href=?]", "/channels/#{secondId}/edit"
  end
  it "renders a new channel button" do
    render
    assert_select "a", :text => "New Channel".to_s, :count => 1
    assert_select "a[href=?]", "/channels/new"
  end
end
