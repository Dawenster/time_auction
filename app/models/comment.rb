class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :auction

  validates :content, :presence => true, :length => { :maximum => 1000 }
  validates :auction, :presence => true
end
