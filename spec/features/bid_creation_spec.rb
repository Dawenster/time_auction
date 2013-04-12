require 'spec_helper'

describe "Bid creation" do

  subject { page }

  describe "creating a bid" do
    let(:auction) { FactoryGirl.create(:auction) }
    let(:user) { FactoryGirl.create(:user) }

    before do
      login_user(user)
      visit auction_path(auction)
      click_button "Bid"
    end

    it { should have_selector('#new_bid_form') }
    
    context "with valid info" do

      it "saves a new bid" do
        fill_in :bid_time, with: "7"
        expect { 
          click_button "Save Bid"
          visit auction_path(auction)
        }.to change(Bid, :count).by(1)
      end
    end
  end
end
