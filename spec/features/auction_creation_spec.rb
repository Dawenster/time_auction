require 'spec_helper'

describe "AuctionCreation" do
  subject { page }

  describe "creating auction" do
    let(:user) { FactoryGirl.create(:user, :admin => true) }
    before do
      login_user(user)
    end

    it "creates auction with valid input" do
      visit new_auction_path
      fill_in :auction_title, with: "Test Title"
      fill_in "Description", with: "Super valid description"
      fill_in :auction_start_date, with: "04/13/2014"
      fill_in :auction_end_date, with: "04/13/2015"
      page.select('Experiences', :from => "auction_category_id")
      click_button 'Create Auction'
      page.should have_content "Test Title"
    end

    it "doesn't create an auction with blank input" do
      visit new_auction_path
      click_button 'Create Auction'
      page.should have_content "Add an Auction"
    end

    it "doesn't create an auction with start date > end date" do
      visit new_auction_path
      fill_in :auction_title, with: "Test Title"
      fill_in "Description", with: "Super valid description"
      fill_in :auction_start_date, with: "04/13/2016"
      fill_in :auction_end_date, with: "04/13/2015"
      page.select('Experiences', :from => "auction_category_id")
      click_button 'Create Auction'
      page.should have_content "Add an Auction"
    end
  end

  describe "editing auction" do
    let(:user) { FactoryGirl.create(:user, :admin => true) }
    let(:auction) { FactoryGirl.create(:auction) }
    before { login_user(user) }

    it "edits auction with valid input" do
      visit edit_auction_path(auction)
      fill_in :auction_title, with: "I changed some stuff"
      click_button 'Create Auction'
      page.should have_content "I changed some stuff"
    end

    it "doesn't edit an auction with blank input" do
      visit edit_auction_path(auction)
      fill_in :auction_title, with: ""
      click_button 'Create Auction'
      page.should have_content "Edit Auction"
    end

    it "doesn't edit an auction with start date > end date" do
      visit edit_auction_path(auction)
      fill_in :auction_start_date, with: "04/13/2016"
      fill_in :auction_end_date, with: "04/13/2015"
      click_button 'Create Auction'
      page.should have_content "Edit Auction"
    end
  end
end
