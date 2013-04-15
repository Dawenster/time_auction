require 'spec_helper'

describe Comment do
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:auction) }
  let!(:auction) { FactoryGirl.create(:auction) }

  it "should save if content is less than 1000 characters" do
    comment = Comment.new(:content => "Hello World")
    comment.auction_id = 1
    comment.save
    comment.should be_valid
  end

  it "should not save if content is more than 1000 characters" do
    comment = Comment.new(:content => "%" * 1001)
    comment.auction_id = 1
    comment.should_not be_valid
  end

end
