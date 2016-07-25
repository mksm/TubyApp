require 'rails_helper'

RSpec.describe "videos/index", type: :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
        :name => "Name",
        :youtube_id => "Youtube",
        :category => Category.create!(:name =>"Category")
      ),
      Video.create!(
        :name => "Name",
        :youtube_id => "Youtube",
        :category => Category.create!(:name =>"Category")
      )
    ])
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Youtube".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
