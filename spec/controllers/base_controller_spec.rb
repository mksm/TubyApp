require 'rails_helper'

RSpec.describe Api::BaseController, type: :request do
  context 'api call using REMOTE_ADDR' do
    before(:each) do
      allow_any_instance_of(Api::BaseController).to receive(:access_id_and_secret_key).and_return(["ABC123", "DEF456"])
      request.headers['remote_addr'] = '62.156.244.13'
      ApiAuthHelpers.set_credentials("ABC123", "DEF456")
    end
    describe "returns ip" do
      it { expect(Api::BaseController.new.send(:remote_ip_address)).to eq(request.env['remote_addr'])}
    end
    describe "ip whitelisted" do
      it { expect(Api::BaseController.new.send(:whitelisted?, "62.156.244.13")).to be true}
    end
    describe "ip not whitelisted" do
      it { expect(Api::BaseController.new.send(:whitelisted?, "63.156.244.13")).to be nil}
    end
  end
  context 'api call using X-Forwarded-For' do
    before(:each) do
      allow_any_instance_of(Api::BaseController).to receive(:access_id_and_secret_key).and_return(["ABC123", "DEF456"])
      request.headers['X-Forwarded-For'] = '192.168.1.100'
      request.headers['remote_addr'] = '192.168.1.101'
      ApiAuthHelpers.set_credentials("ABC123", "DEF456")
    end
    describe "returns ip" do
      it { expect(Api::BaseController.new.send(:remote_ip_address)).to eq(request.env['remote_addr'])}
    end
    describe "ip whitelisted" do
      it { expect(Api::BaseController.new.send(:whitelisted?, "62.156.244.13")).to be true}
    end
    describe "ip not whitelisted" do
      it { expect(Api::BaseController.new.send(:whitelisted?, "63.156.244.13")).to be nil}
    end
  end
end
