require 'date'

class Auction < ActiveRecord::Base
  attr_accessible :category_id, :description, :start_date, :end_date, :title, :winner_id, :verified_time, :deadline, :photos_attributes
  has_many :bids, :order => 'bids.created_at DESC', :dependent => :destroy
  has_many :users, through: :bids
  has_many :photos, :as => :imageable, :dependent => :destroy
  has_many :comments, :order => 'comments.created_at DESC', :dependent => :destroy


  belongs_to :category
  accepts_nested_attributes_for :photos 
  before_validation :set_dates
  before_create :initial_verified_time
  validates :deadline, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true
  validates :category_id, :presence => true
  # validate :valid_dates

  def self.check_auction_finished
    # scope find finished bids
    # auctions = Auction.finished
    @auctions = Auction.all
    @finished = @auctions.select { |auction| auction.end_date < Time.now && auction.bids.any? && !auction.winner_id }
    
    # set winner_id to owner of highest bid for each auction
    @finished.each do |auction|
      auction.winner_id = auction.highest_bid.user.id
      auction.save # what happens if this reutrns false
      
      # identify unique bidders of auction
      uniq_users = auction.users.uniq # is this in rails?
      bid_ids = []
      uniq_users.each do |user|
        # find the id of the last bid placed, for this auction
        bid_ids << user.bids.where(:auction_id => auction.id).order("time DESC").first.id
      end

      # returning finished auction!!

      AuctionEndWorker.perform_async(bid_ids)
    end
  end

  def highest_bid
    self.bids.order("time DESC").first || NullBid.new
  end

  class NullBid < Bid
    def time
      0
    end
  end

  def started?
    Time.now >= self.start_date
  end

  def complete?
    self.winner_id
  end

  def parse_dates(params)
    self.start_date = DateTime.parse(params[:auction].delete(:start_date).split('/').rotate(-1).join(''))
    self.end_date = DateTime.parse(params[:auction].delete(:end_date).split('/').rotate(-1).join(''))
  end

  private

  def initial_verified_time
    self.verified_time = 0
  end

  def valid_dates
    errors.add(:base, "Start date must be before end date") unless self.start_date < self.end_date
  end

  def set_dates
    self.deadline = self.end_date + 1.month if self.end_date
  end

end
