class Charity < ActiveRecord::Base
  attr_accessible :name, :description, :photos_attributes
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :description, :presence => true

  has_many :bids
  has_many :photos, :as => :imageable
  accepts_nested_attributes_for :photos
end