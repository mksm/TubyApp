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
      
      it { expect(response).to render_template('videos/multiple_new') }
      it { expect(assigns(:videos).count).to eq 1 }
    end
    
  end
  
  describe 'POST #create_multiple' do
    context 'two videos' do
      let!(:category) { create(:category) }
      let(:user) { create(:user) }
      
      before do
        sign_in user
        post :create_multiple, params: { videos: {
          "0"=>{name: "Minions Home", youtube_id: "dKYXpcbdgFe", category_id: category.id}, 
          "1"=>{name: "Minions Home", youtube_id: "dKYXpcbdgFa", category_id: category.id}} } 
      end
      
      it { expect(response).to redirect_to(videos_path) }
      it { expect(Video.count).to eq 2 }
    end
    
    context 'invalid second video with missing category' do
      let!(:category) { create(:category) }
      let(:user) { create(:user) }
      
      before do
        sign_in user
        post :create_multiple, params: { videos: {
          "0"=>{name: "Minions Home", youtube_id: "dKYXpcbdgFe", category_id: category.id}, 
          "1"=>{name: "Minions Home", youtube_id: "dKYXpcbdgFa", category_id: ""}} } 
      end
      
      it { expect(response).to render_template("videos/multiple_new") }
      it { expect(Video.count).to eq 0 }
    end
  end
end