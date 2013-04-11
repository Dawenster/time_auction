class Auction < ActiveRecord::Base
  attr_accessible :category_id, :deadline, :description, :end_date, :title, :winner_id
end
