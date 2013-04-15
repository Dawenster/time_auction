class Photo < ActiveRecord::Base
  attr_accessible :url, :imageable_type, :imageable_id
  belongs_to :user
  belongs_to :auction
  belongs_to :charity
  belongs_to :imageable, polymorphic: true

  mount_uploader :url, PhotoUploader
end
