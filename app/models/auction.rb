class Auction < ActiveRecord::Base
  attr_accessible :category_id, :deadline, :description, :end_date, :title, :winner_id
  
  has_and_belongs_to_many :users

  validates_presence_of :title, :description, :end_date, :category_id, :deadline

  before_save :create_deadline

  def create_deadline
    self.deadline = self.end_date.month + 1 
  end
  
end
