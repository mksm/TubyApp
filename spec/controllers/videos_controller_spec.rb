require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  let(:valid_attributes) {
    {name_en:"name1", youtube_id:"dKYXpcbdgFe", channel_id:FactoryGirl.create(:channel).id}
  }
  let(:invalid_attributes) {
    {name_en:"aq", youtube_id:nil, channel_id:FactoryGirl.create(:channel).id}
  }

    context 'as user' do
      let(:user) { create(:user) }
      before do
        sign_in user
      end
      describe "GET #index" do
        it "assigns all videos as @videos" do
          video = Video.create! FactoryGirl.build(:video).attributes
          get :index, params: {}
          expect(assigns(:videos)).to eq([video])
        end
      end
      describe "GET #edit" do
        it "assigns the requested video as @video" do
          video = Video.create! FactoryGirl.build(:video).attributes
          get :edit, params: {id: video.to_param}
          expect(assigns(:video)).to eq(video)
        end
      end
      describe "POST #create" do
        context "with valid params" do
          it "creates a new Video" do
            video = FactoryGirl.build(:video)
            expect {
              post :create, params: {video:{"name_en": video.name_en, "youtube_id": video.youtube_id, "channel_id": video.channel_id}}
            }.to change(Video, :count).by(1)
          end
          it "assigns a newly created video as @video" do
            video = FactoryGirl.build(:video)
            post :create, params: {video:{"name_en": video.name_en, "youtube_id": video.youtube_id, "channel_id": video.channel_id}}
            expect(assigns(:video)).to be_a(Video)
            expect(assigns(:video)).to be_persisted
          end
          it "redirects to the videos list" do
            video = FactoryGirl.build(:video)
            post :create, params: {video:{"name_en": video.name_en, "youtube_id": video.youtube_id, "channel_id": video.channel_id}}
            expect(response).to redirect_to(videos_url)
          end
        end
        context "with invalid params" do
          it "re-renders the 'new' template" do
            post :create, params: {video: invalid_attributes}
            expect(response).to render_template("new")
          end
        end
      end
      describe "PUT #update" do
        context "with valid params" do
          let(:new_attributes) {
            {name_en:"name11", name_ar:"11 اسم", youtube_id:"111dKYXpcbdgFe", channel_id:FactoryGirl.create(:channel).id}
          }
          it "updates the requested video" do
            video = Video.create! valid_attributes
            old_video_name = video.name_en
            put :update, params: {id: video.to_param, video: new_attributes}
            video.reload
            expect(video.name_en).not_to eq(valid_attributes[:name_en])
            expect(video.name_ar).not_to eq(valid_attributes[:name_ar])
            expect(video.youtube_id).not_to eq(valid_attributes[:youtube_id])
          end
          it "assigns the requested video as @video" do
            video = Video.create! valid_attributes
            put :update, params: {id: video.to_param, video: new_attributes}
            video.reload
            expect(assigns(:video)).to eq(video)
          end
          it "redirects to the videos list" do
            video = Video.create! valid_attributes
            put :update, params: {id: video.to_param, video: new_attributes}
            expect(response).to redirect_to(videos_url)
          end
        end
        context "with invalid params" do
          it "assigns the video as @video" do
            video = Video.create! valid_attributes
            put :update, params: {id: video.to_param, video: invalid_attributes}
            expect(assigns(:video)).to eq(video)
          end

          it "re-renders the 'edit' template" do
            video = Video.create! valid_attributes
            put :update, params: {id: video.to_param, video: invalid_attributes}
            expect(response).to render_template("edit")
          end
        end
      end
      describe "DELETE #destroy" do
        it "destroys the requested video" do
          video = Video.create! valid_attributes
          expect {
            delete :destroy, params: {id: video.to_param}
          }.to change(Video, :count).by(-1)
        end

        it "redirects to the videos list" do
          video = Video.create! valid_attributes
          delete :destroy, params: {id: video.to_param}
          expect(response).to redirect_to(videos_url)
        end
      end
    end

end
