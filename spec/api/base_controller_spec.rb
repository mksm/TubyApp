require 'rails_helper'

feature 'ip whitelist' do

  before(:each) do
    allow_any_instance_of(Api::BaseController).to receive(:access_id_and_secret_key).and_return(["ABC123", "DEF456"])
    ApiAuthHelpers.set_credentials("ABC123", "DEF456")
  end
  context "valid ip" do
    it { expect(Api::BaseController.new.send(:whitelisted?, "62.156.244.13")).to be true}
  end
  context "invalid ip" do
    it { expect(Api::BaseController.new.send(:whitelisted?, "63.156.244.13")).to be nil}
  end
end
