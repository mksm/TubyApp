require 'rails_helper'

RSpec.describe Channel, type: :model do

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
