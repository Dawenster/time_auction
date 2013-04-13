class AddStartDateToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :start_date, :datetime
  end
end
