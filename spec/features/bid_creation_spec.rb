require 'spec_helper'

describe "Bid creation" do

  subject { page }

  describe "creating a bid", :js => true do
    let!(:auction) { FactoryGirl.create(:auction) }
    let!(:user) { FactoryGirl.create(:user) }

    before do
      login_user(user)
      visit auction_path(auction)
      click_button "Bid hours"
    end

    it { should have_selector('#new_bid_form') }
    
    context "with valid info" do

      it "saves a new bid" do
        expect { 
          fill_in :bid_time, with: "7"
          click_button "Submit Bid"
          visit root_path
        }.to change(Bid, :count).by(1)
      end
    end

    context "when the form is submitted without a time" do

      it "does not save a new bid" do
        expect { 
          click_button "Submit Bid"
          visit auction_path(auction)
        }.not_to change(Bid, :count)
      end

      it "displays an error" do
        click_button "Submit Bid"
        should have_content 'Please' || 'must be higher'
      end
    end
  end

  describe "when the submitted bid is less than the current highest", :js => true do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:auction) { FactoryGirl.create(:auction) }
    let!(:bid) { FactoryGirl.create(:bid, :time => 5, :auction_id => auction.id) }

    before do
      login_user(user)
      visit auction_path(auction)
      click_button "Bid hours"
    end

    it "cannot create a bid" do
      fill_in :bid_time, with: "4"
      expect { 
        click_button "Submit Bid"
        visit auction_path(auction)
      }.not_to change(Bid, :count)
    end
  end
end
