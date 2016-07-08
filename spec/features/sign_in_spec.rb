require 'rails_helper'

feature 'sign in' do

  let(:user) { create(:user) }

  it "see the videos page after sign in" do 
    visit new_user_session_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Log in'
    expect(current_path).to eql "/videos"
  end 

end