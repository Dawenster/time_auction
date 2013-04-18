require 'spec_helper'

describe Auction do

  let!(:auction) {FactoryGirl.create(:auction) }
  let!(:one_hour_bid) {FactoryGirl.create(:bid)}
  subject { auction }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { should validate_presence_of(:category_id) }
  it { should have_many(:users).through(:bids) }
  it { should have_many(:photos) }

  it "should create a deadline based on the end date" do
    auction.deadline.should_not be_blank
  end

  it "should initialize with zero verified hours" do
    auction.verified_time.should == 0
  end

  it "should return highest bid when highest_bid method is called" do
    one_hour_bid.update_attribute(:auction_id, auction.id)
    higher_bid = Bid.create(time:5, auction_id: auction.id, user_id: 2)
    auction.highest_bid.should == higher_bid
  end
end
