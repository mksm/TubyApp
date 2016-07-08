require 'rails_helper'

feature 'view videos' do

  let(:user) { create(:user) }

  it "redirects to login if the user isnt signed in" do 
    visit videos_path
    expect(current_path).to eql new_user_session_path
  end 

end