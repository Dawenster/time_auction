require 'date'

class Auction < ActiveRecord::Base
  attr_accessible :category_id, :description, :end_date, :title, :winner_id
  
  has_and_belongs_to_many :users
  belongs_to :category

  validates :title, :presence => true
  validates :description, :presence => true
  validates :end_date, :presence => true
  validates :category_id, :presence => true
  validates :deadline, :presence => true
  before_validation :create_deadline, :on => :save

  private
  def create_deadline
    puts self.inspect
    self.deadline = self.end_date + 30 #self.end_date >> 1 #TODO: Hardcoded deadline atm
  end

end
