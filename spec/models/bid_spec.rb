require 'spec_helper'

describe Bid do
  it { should respond_to :time }
  it { should validate_presence_of :time }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :auction_id }
  it { should belong_to :user }
  it { should belong_to :auction }
  it { should belong_to :charity }

  context "auction with existing bids" do
    let(:auction) { FactoryGirl.create(:auction) }
    let(:user) { FactoryGirl.create(:user) }
    let!(:existing_bid) { FactoryGirl.create(:bid, time: 5, auction_id: auction.id) }

    it 'is valid when time > existing bid times' do
      bid = Bid.new(user_id: user.id, auction_id: auction.id, time: 6)
      bid.should be_valid
    end

    it "is not valid if lower than existing bid in the auction" do
      bid = Bid.new(user_id: user.id, auction_id: auction.id, time: 4)
      bid.should_not be_valid
    end
  end
end
