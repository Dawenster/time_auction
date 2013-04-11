class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :time
      t.integer :user_id
      t.integer :auction_id
      t.integer :charity_id

      t.timestamps
    end
  end
end
