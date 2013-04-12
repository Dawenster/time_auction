class Photo < ActiveRecord::Base
  attr_accessible :url
  belongs_to :user
  belongs_to :auction
  belongs_to :imageable, polymorphic: true

end
