require 'rails_helper'

feature 'categories list' do

  context "no categories" do    
    before(:each) { get "/api/categories.json" } 
    
    it { expect(response.status).to eq 200 }
    it { expect(response.body).to eq "[]"}
  end

  context "single category" do
    let!(:c1) { create(:category, name: "Cartoons") }
    
    before(:each) { get "/api/categories.json" } 
    
    it { expect(response.status).to eq 200 }
    it { expect(response.body).to eq "[{\"id\":#{c1.id},\"name\":\"Cartoons\"}]"}
  end
  
end