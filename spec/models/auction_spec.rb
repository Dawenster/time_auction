require 'spec_helper'

describe Auction do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:end_date) }
  it { should validate_presence_of(:category_id) }
  it { should have_many(:users).through(:bids) }
  

  let!(:auction) { FactoryGirl.create(:auction) }

  # it "should create a deadline" do 
        
  # end

  it "should create a deadline based on the end date" do
    auction.deadline.should_not be_blank
  end

end
