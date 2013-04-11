class Auction < ActiveRecord::Base
  attr_accessible :category_id, :deadline, :description, :end_date, :title, :winner_id
  
  has_and_belongs_to_many :users

  validates_presence_of :title, :description, :end_date, :category_id, :deadline

  
end
