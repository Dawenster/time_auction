class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :provider
      t.integer :uid
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :name
      t.string :username
      t.string :email
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
