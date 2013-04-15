class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :phone, :password, :time_donated, :admin
  has_many :bids
  has_many :auctions, through: :bids
  has_many :comments
  has_one :photo, :as => :imageable
  has_many :identities

  validates :name, :presence => true
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :email, :format => { :with => /^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/ }
  validates :phone, :format => { :with => /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/ }, :unless => :empty?
 
  def empty?
    phone == ""
  end

  def profile_pic
    if self.photo
      "<%= cl_image_tag @user.photo.url, :width => 200, :height => 200, :crop => :fill %>"
    elsif
      return true
    else
      "<%= image_tag '/assets/avatar_blank.jpg' %>"
    end
  end

  def self.create_with_omniauth(info)
    create(name: info[:name], email: info[:email])
  end
end
