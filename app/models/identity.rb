class Identity < ActiveRecord::Base
  attr_accessible :email, :image, :name, :oauth_expires_at, :oauth_token, :provider, :uid, :username, :user_id
  belongs_to :user
  validates :provider, presence: true

  def self.find_with_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end

  def self.create_with_omniauth(auth)
    create(email: auth['info']['email'], 
           image: auth['info']['image'],
           name: auth['info']['name'], 
           oauth_token: auth['credentials']['token'], 
           oauth_expires_at: Time.at(auth['credentials']['expires_at']), 
           provider: auth['provider'], 
           uid: auth['uid'], 
           username: auth['extra']['raw_info']['username'])
  end

  def update_with_omniauth(auth)
    self.email = auth['info']['email']
    self.image = auth['info']['image']
    self.name = auth['info']['name']
    self.oauth_token = auth['credentials']['token']
    self.oauth_expires_at = Time.at(auth['credentials']['expires_at'])
    self.uid = auth['uid']
    self.username = auth['extra']['raw_info']['username']
    self.save!
  end

  def create_user
    user = User.create( name: self.name, email: self.email, phone: "", password: "foobar" )
    self.user_id = user.id
    self.save!
  end
end
