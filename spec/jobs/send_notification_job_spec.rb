require 'rails_helper'

RSpec.describe SendNotificationJob, type: :job do
  
  describe "#send_notification" do
    let(:notifiable_url) { "notifiable" }
    let(:notifiable_access_id) { "ABC123" }
    let(:notifiable_app_id) { "53" }
    let(:locale) { "en" }
    let(:message) { "A message notification" }
    
    before(:each) do
      stub_request(:post, "http://#{notifiable_url}/notifications_api/v1/notifications").
               with(:body => {
                 "app_id"=>notifiable_app_id, 
                 "notification"=>{"localized_notifications_attributes"=>[
                   {"message"=>message, "locale"=> locale}]}},
                    :headers => {'Authorization' => notifiable_access_id}).
               to_return(:status => 200)
      
      @response = subject.send(:send_notification, notifiable_url, notifiable_access_id, notifiable_app_id, locale, message)
    end
    
    it { expect(@response).to eq 200 }
  end
end
