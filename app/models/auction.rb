require 'date'

class Auction < ActiveRecord::Base
  attr_accessible :category_id, :description, :start_date, :end_date, :title, :winner_id, :verified_time, :deadline, :photos_attributes
  has_many :bids, :dependent => :destroy
  has_many :users, through: :bids
  has_many :photos, :as => :imageable, :dependent => :destroy
  has_many :comments, :order => 'comments.created_at DESC', :dependent => :destroy


  belongs_to :category
  accepts_nested_attributes_for :photos 
  before_validation :create_deadline
  before_create :initial_verified_time

  validates :deadline, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true
  validates :category_id, :presence => true
  
  def highest_bid
    self.bids.last unless self.bids.empty? 
  end

  def started?
    Time.now >= self.start_date
  end

  def complete?
    self.winner_id
  end

  private

  def initial_verified_time
    self.verified_time = 0
  end


  def create_deadline
    self.deadline = self.end_date + 1.month if self.end_date
  end

end
