require 'rails_helper'

RSpec.describe Video, type: :model do

  it "has a valid factory" do
        create(:video).should be_valid
  end

  it "is invalid without a video name"
  it "is invalid without a youtube id"

end
