class Bid < ActiveRecord::Base
  attr_accessible :auction_id, :charity_id, :time, :user_id
  validates :auction_id, presence: true
  validates :user_id, presence: true
  validates :time, presence: true
  belongs_to :user
  belongs_to :auction
  belongs_to :charity
  validate :highest_in_auction

  def to_json
    { name: self.user.name }.to_json
  end

  def description
    self.time.to_s + " hours"
  end

  private
    def highest_in_auction
      if self.auction && self.auction.bids.where("time >= ?", self.time).any?
        self.errors.add(:time, 'must be greater than the highest bid')
      end
    end
end
