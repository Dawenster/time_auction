class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :description
      t.datetime :end_date
      t.integer :category_id
      t.integer :winner_id
      t.datetime :deadline

      t.timestamps
    end
  end
end
