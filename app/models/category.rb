class Category < ActiveRecord::Base
  ORDERED_LIST = ['People', 'Products', 'Experiences']
  attr_accessible :name
  validates :name, :presence => true
  has_many :auctions
end
