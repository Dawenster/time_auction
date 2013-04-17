require 'spec_helper'

describe "AuctionEdit" do
  subject { page }

  describe "editing an auction" do
    let(:user) { FactoryGirl.create(:user, :admin => true) }
    let!(:auction) { FactoryGirl.create(:auction)} # does not have winner_id 
    
    before do
      login_user(user)
      visit edit_auction_path(auction)
    end

    it "should not update an auction with start date after an end date" do
      fill_in :auction_start_date, with: "04/13/2016"
      fill_in :auction_end_date, with: "04/13/2015"
      page.select('Experiences', :from => "auction_category_id")
      click_button 'Update Auction'
      page.should have_content "must be before"
    end

    it "should update an auction with valid start and end date" do
      fill_in :auction_start_date, with: "04/13/2015"
      fill_in :auction_end_date, with: "04/13/2016"
      page.select('Experiences', :from => "auction_category_id")
      click_button 'Update Auction'
      page.should have_content("2015")
      page.should have_content("2016")
    end

    it "should not allow updating verified hours until winner id present" do
      fill_in :auction_verified_time, with: 10
      click_button 'Update Auction'
      page.should have_content('Edit Auction')
    end

    it "should allow updating verified hours when winner_id present" do
      fill_in :auction_verified_time, with: 10
      click_button 'Update Auction'
      page.should have_content('Comments') 
    end
  end
end

