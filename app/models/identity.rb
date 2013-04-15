class Identity < ActiveRecord::Base
  attr_accessible :email, :image, :name, :oauth_expires_at, :oauth_token, :provider, :uid, :username, :user_id
  belongs_to :user
end
