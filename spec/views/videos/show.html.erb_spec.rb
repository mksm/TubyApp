require 'rails_helper'

RSpec.describe "videos/show", type: :view do
  before(:each) do
    @video = assign(:video, Video.create!(
        :name => "Name",
        :youtube_id => "Youtube",
        :category => Category.create!(:name =>"Category")
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Youtube/)
    expect(rendered).to match(/Category/)
  end
end
