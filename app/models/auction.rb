require 'date'

class Auction < ActiveRecord::Base
  attr_accessible :category_id, :deadline, :description, :end_date, :title, :winner_id
  
  has_and_belongs_to_many :users

  before_validation :create_deadline, :on => :create

  validates_presence_of :title, :description, :end_date, :category_id, :deadline


  def create_deadline
    self.deadline = self.end_date >> 1 #TODO: Hardcoded deadline atm
  end

end
