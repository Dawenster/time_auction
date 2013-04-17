class Bid < ActiveRecord::Base
  attr_accessible :auction_id, :charity_id, :time, :user_id
  validates :auction_id, presence: true
  validates :user_id, presence: true
  validates :time, presence: true
  belongs_to :user
  belongs_to :auction
  belongs_to :charity

  def to_json
    { name: self.user.name }.to_json
  end

  def description
    self.time.to_s + " hours"
  end
end
