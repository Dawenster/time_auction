require 'date'

class Auction < ActiveRecord::Base
  attr_accessible :category_id, :description, :end_date, :title, :winner_id
  has_many :bids
  has_many :users, through: :bids
  
  belongs_to :category

  before_validation :create_deadline

  validates :deadline, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
  validates :end_date, :presence => true
  validates :category_id, :presence => true
  
  def highest_bid
    self.bids.last 
  end

  private

  def create_deadline
    self.deadline = self.end_date + 1.month if self.end_date
  end

end
