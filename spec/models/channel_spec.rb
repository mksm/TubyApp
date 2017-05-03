require 'rails_helper'

RSpec.describe Channel, type: :model do

  let(:array_of_videos){[{:name_en=>"Trains for kids — Cars Cartoon. Water in the tank. Educational Video for children. Episode 2", :youtube_id=>"HsWFu3Ef1ks"}, {:name_en=>"Trains for kids — Cars Cartoon. Learn to count to 3. Educational Video for children. Episode 1", :youtube_id=>"I8ORkPH1870"}]}

  describe '#name' do
    context 'invalid' do
      subject { build(:channel, name: nil) }
      it { expect(subject).to_not be_valid }
    end
  end

  describe '#youtube_id' do
    context 'invalid' do
      subject { build(:channel, youtube_id: nil) }
      it { expect(subject).to_not be_valid }
    end
  end

  describe '#videos' do
    context 'invalid' do
      subject { create(:channel, videos: create_list(:video, 2)) }
      before(:each) { subject.videos.last.destroy }
      it { expect(subject.videos.count).to eq 1}
    end
  end

  describe '#new_videos' do
    context 'without videos' do
      it 'returns all videos from youtube' do
        subject {create(:channel)}
        allow(subject).to receive(:yt_videos).and_return(array_of_videos)
        expect(subject.new_videos.count).to eq 2
      end
    end
    context 'with videos' do
      subject {create(:channel)}
      before(:each) do
        FactoryGirl.create(:video , youtube_id:"HsWFu3Ef1ks", channel_id:subject.id)
      end
      it 'compares and retrieve new videos' do
        allow(subject).to receive(:yt_videos).and_return(array_of_videos)
        expect(subject.new_videos.count).to eq 1
        expect(subject.new_videos[0]).to_not eq subject.videos.first
      end
    end
  end

  describe '#delete_videos_missing_from_yt' do
    context 'video not present in the yt channel' do
      subject {create(:channel, videos: create_list(:video, 2))}
      it 'deletes the video' do
        video_id_to_delete = subject.videos.first.youtube_id
        allow(subject).to receive(:videos_missing_from_yt).and_return([video_id_to_delete])
        subject.delete_videos_missing_from_yt
        expect(subject.videos.count).to eq 1
        expect(Video.find_by_youtube_id(video_id_to_delete)).to eq nil
      end
    end
    context 'channel updated with yt channel' do
      subject {create(:channel, videos: create_list(:video, 2))}
      it 'no changes' do
        allow(subject).to receive(:videos_missing_from_yt).and_return([])
        subject.delete_videos_missing_from_yt
        expect(subject.videos.count).to eq 2
      end
    end
  end
  describe '#videos_missing_from_yt' do
    context 'video not present in the yt channel' do
      subject {create(:channel, videos: create_list(:video, 2))}
      it 'retrieves the youtube_id of the video' do
        video_id_to_delete = subject.videos[0].youtube_id
        allow(subject).to receive(:yt_videos).and_return([{:name_en=>subject.videos[1].name_en, :youtube_id=>subject.videos[1].youtube_id}])
        expect(subject.videos_missing_from_yt).to eq [video_id_to_delete]
      end
    end
    context 'channel updated with yt channel' do
      subject {create(:channel, videos: create_list(:video, 2))}
      it 'retrieves empty array' do
        allow(subject).to receive(:yt_videos).and_return([{:name_en=>subject.videos[0].name_en, :youtube_id=>subject.videos[0].youtube_id},{:name_en=>subject.videos[1].name_en, :youtube_id=>subject.videos[1].youtube_id}])
        subject.delete_videos_missing_from_yt
        expect(subject.videos_missing_from_yt).to eq []
      end
    end
  end

  describe '#add_videos' do
    context 'not updated with yt channel' do
      subject {create(:channel)}
      it 'creates new videos' do
        allow(subject).to receive(:new_videos).and_return(array_of_videos)
        expect{subject.add_videos}.to change{Video.all.count}.by(2)
      end
    end
    context 'updated with yt channel' do
      subject {create(:channel)}
      it 'no changes' do
        allow(subject).to receive(:new_videos).and_return([])
        expect{subject.add_videos}.to_not change{Video.all.count}
      end
    end
  end

  describe "#upload_csv" do
    context "with a single channel" do
      before(:each) { Channel.import_csv(fixture_csv) }
      it { expect(Channel.count).to eq 1 }
    end

    context "with a multiple channels" do
      before(:each) { Channel.import_csv(fixture_csv('channels_2.csv')) }
      it { expect(Channel.count).to eq 3 }
    end

    context "with field spacing" do
      before(:each) { Channel.import_csv(fixture_csv("channels_spaced_fields.csv")) }
      it { expect(Channel.count).to eq 1 }
      it { expect(Channel.first.name).to eq "Kids TV Baby" }
      it { expect(Channel.first.youtube_id).to eq "UC2U_C1EylcbiIv62MT0Uzkw" }
    end
  end
end
