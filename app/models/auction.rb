require 'date'

class Auction < ActiveRecord::Base
  attr_accessible :category_id, :description, :end_date, :title, :winner_id
  
  has_and_belongs_to_many :users

  before_validation :create_deadline, :on => :create

  validates :title, :description, :end_date, :category_id, :deadline, :presence => true


  def create_deadline
    self.update_attribute(:deadline, DateTime.now + 15)#self.end_date >> 1 #TODO: Hardcoded deadline atm
  end

end
