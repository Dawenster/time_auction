class AddVerifiedTimeToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :verified_time, :integer
  end
end
