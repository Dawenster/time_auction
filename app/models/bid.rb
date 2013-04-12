class Bid < ActiveRecord::Base
  attr_accessible :auction_id, :charity_id, :time, :user_id
  validates :auction_id, presence: true
  validates :user_id, presence: true
  validates :time, presence: true
  belongs_to :user
  belongs_to :auction

  def to_json
    { name: self.user.name }.to_json
  end
end
