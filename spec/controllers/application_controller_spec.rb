require 'rails_helper'

describe ApplicationController do
  describe 'POST #notify' do
    let!(:channel) { create(:channel) }
    let(:user) { create(:user) }

    before do
      sign_in user
      post :notify, params: { message: "We've added new videos" }
    end

    it { expect(response.code).to eq "302" }
    it { expect(Delayed::Job.count).to eq 1 }
    it { expect(Delayed::Job.first.payload_object.job_data["arguments"][0]).to eq "We've added new videos" }
  end
end
