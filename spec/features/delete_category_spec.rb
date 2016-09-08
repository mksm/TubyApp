require 'rails_helper'

feature 'delete category' do

  let!(:category) { create(:category) }
  let!(:video) { create(:video, category: category) }
  let(:user) { create(:user) }
  
  before do
    login_as user
  end

  it "redirects to login if the user isnt signed in" do 
    visit categories_path
    click_link "Delete"    
    
    expect(Category.count).to eq 0
    expect(Video.count).to eq 0
    expect(current_path).to eql categories_path
  end 

end