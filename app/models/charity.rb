class Charity < ActiveRecord::Base
  attr_accessible :name, :description, :photos_attributes
  validates :name, :presence => true
  validates :name, :uniqueness => true

  has_many :bids
  has_many :photos, :as => :imageable, :dependent => :destroy
  accepts_nested_attributes_for :photos
end