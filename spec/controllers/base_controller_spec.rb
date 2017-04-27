require 'rails_helper'

RSpec.describe Api::BaseController, type: :controller do
  before(:each) do
    allow_any_instance_of(Api::BaseController).to receive(:access_id_and_secret_key).and_return(["ABC123", "DEF456"])
    allow_any_instance_of(Api::BaseController).to receive(:whitelist_enabled?).and_return(true)
    allow_any_instance_of(Api::BaseController).to receive(:get_whitelist_range).and_return("192.168.0.1,192.168.0.9")
    ApiAuthHelpers.set_credentials("ABC123", "DEF456")
    request.remote_addr = '62.156.244.15'
    request.env['X-Forwarded-For'] = '192.168.1.100'
  end
  context 'api call using remote_addr' do
    describe "returns  remote_addr" do
      it { expect(Api::BaseController.new.send(:remote_ip_address, request)).to eq(request.remote_addr)}
    end
  end
  context 'api call using X-Forwarded-For' do
    describe "returns remote_addr" do
      it { expect(Api::BaseController.new.send(:remote_ip_address, request)).to eq(request.remote_addr)}
    end
  end
  context 'api call with' do
    describe "ip whitelisted" do
      it { expect(Api::BaseController.new.send(:whitelisted?, "62.156.244.13")).to be true}
    end
    describe "ip not whitelisted" do
      it { expect(Api::BaseController.new.send(:whitelisted?, "63.156.244.13")).to be nil}
    end
  end
end
