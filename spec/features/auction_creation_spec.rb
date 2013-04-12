require 'spec_helper'

describe "AuctionCreation" do

  subject { page }

  describe "creating auction" do
    before do
      visit new_user_path 
      fill_in :user_name, with: "Test Name"
      fill_in :user_email, with: "j@example.com"
      fill_in :user_phone, with: "310-333-3333"
      fill_in :user_password, with: "Password1"
      click_button "Create User"
    end

    it "creates auction with valid input" do
      visit new_auction_path
      fill_in "Title", with: "Test Title"
      fill_in "Description", with: "Super valid description"
      page.select('Experiences', :from => "auction_category_id")
      click_button 'Create Auction'
      page.should have_content "Test Title"
    end

    it "doesn't create an auction with invalid input" do
      visit new_auction_path
      click_button 'Create Auction'
      page.should have_content "Add an Auction"
    end
  end
end
