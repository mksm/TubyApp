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

end
