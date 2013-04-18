require 'spec_helper'

describe "Bid creation" do

  subject { page }

  describe "creating a bid" do
    let!(:auction) { FactoryGirl.create(:auction) }
    let!(:first_user) { FactoryGirl.create(:user) }
    let!(:existing_bid) { FactoryGirl.create(:bid, user_id: first_user.id, auction_id: auction.id) }
    let!(:user) { FactoryGirl.create(:user) }

    before do
      login_user(user)
      visit auction_path(auction)
    end

    it { should have_selector('#new_bid_form') }
    
    context "with valid info" do

      it "saves a new bid", js: true do
        expect do
          click_button "Bid Hours"
          fill_in :bid_time, with: "7"
          click_button "Submit Bid"
          visit auction_path(auction)
        end.to change(Bid, :count).by(1)
      end

      it "should show up at the top", js: true do
        click_button "Bid Hours"
        fill_in :bid_time, with: "8"
        click_button "Submit Bid"
        visit auction_path(auction)
        page.find('#bidsTab').click
        page.should have_selector('table:nth-child(2) td', text: user.name)
      end

      it "shows success popup page", js: true do
        click_button "Bid Hours"
        fill_in :bid_time, with: '9'
        click_button "Submit Bid"
        page.should have_content "Thank you"
      end
    end

    context "when the form is submitted without a time" do

      it "does not save a new bid" do
        expect { 
          click_button "Submit Bid"
          visit auction_path(auction)
        }.not_to change(Bid, :count)
      end

      it "displays an error", js: true do
        click_button "Bid Hours"
        click_button "Submit Bid"
        should have_content 'Please' || 'must be higher'
      end

      it 'does not show success popup' do
        click_button "Submit Bid"
        page.should_not have_selector('alert-error')
      end
    end
  end

  describe "when the submitted bid is less than the current highest" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:auction) { FactoryGirl.create(:auction) }
    # let!(:bid) { FactoryGirl.create(:bid, :time => 5, :auction_id => auction.id) }

    before do
      login_user(user)
      visit auction_path(auction)
      # click_button "Bid Hours"
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
