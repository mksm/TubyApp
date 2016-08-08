require 'rails_helper'

RSpec.describe Category, type: :model do

  describe "#videos" do
    context "destroy dependent" do
      let!(:category) { create(:category, :videos => create_list(:video, 1)) }
      
      before(:each) { Category.first.destroy!; }
      
      xit { expect(Category.count).to eq 0 }
      xit { expect(Video.count).to eq 0 }
    end
  end

  it "is invalid without a name"  do
    expect( build(:category, name: nil) ).not_to be_valid
  end
  
end
