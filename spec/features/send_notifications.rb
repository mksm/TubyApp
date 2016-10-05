require 'rails_helper'

feature 'send notification ' do

  let!(:category) { create(:category) }
  let!(:video) { create(:video, category: category) }
  let(:user) { create(:user) }

  before do
    login_as user
  end

  it "has Notifiable parameters defined" do

    expect(ENV["NOTIFIABLE_URL"]).not_to be_nil
    expect(ENV["NOTIFIABLE_APP_ID"]).not_to be_nil
    expect(ENV["NOTIFIABLE_ACCESS_ID"]).not_to be_nil

  end

  xit "sends notification" do
    visit categories_path
    click_link('Send Notification')

   # expect(current_path).to eql category_notify_path
    # expect(page).to have_content("Notification has been sent.", wait: 3)

  end

end