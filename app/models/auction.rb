require 'date'

class Auction < ActiveRecord::Base
  attr_accessible :category_id, :description, :end_date, :title, :winner_id
  
  has_and_belongs_to_many :users
  belongs_to :category

  before_validation :create_deadline

  validates :deadline, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
  validates :end_date, :presence => true
  validates :category_id, :presence => true
  

  private
  def create_deadline
    self.deadline = self.end_date >> 1
  end
end
