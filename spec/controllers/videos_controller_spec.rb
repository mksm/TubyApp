require 'rails_helper'

describe VideosController do
  describe 'POST #upload_csv' do
    
    context 'as a user' do
      let!(:category) { create(:category) }
      let(:user) { create(:user) }
      
      before do
        sign_in user
        post :upload_csv, params: { csv_file: fixture_file_upload('videos_1.csv','text/csv') }
      end
      
      it { is_expected.to respond_with :redirect }
      it { expect(Video.count).to eq 1 }
    end
    
  end
end