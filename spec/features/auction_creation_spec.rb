require 'spec_helper'

describe "AuctionCreation" do

  subject { page }

  describe "creating auction" do
    before { visit new_user_path } do
      fill_in :user_name, with: "Test Name"
      fill_in :user_email, with: "j@example.com"
      fill_in :user_phone, with: "310-333-3333"
      fill_in :user_password, with: "Password1"
    end

    it "creates auction with valid input" do
      visit new_auction_path
      fill_in :title, with: "Test Title"
      fill_in :description, with: "Super valid description"
      select('Experiences', :from => 'Category') # gon fail
      fill_in :month, with: '04'


  end
end


end
