require 'spec_helper'

describe "Category index page", :js => true do
	let!(:auction) {FactoryGirl.create(:auction)}
	
	before do
		
	end

	# it "should display auctions for corresponding category" do
	# 	category = Category.find_by_name("People")
	# 	auction.update_attribute(:category_id, category.id)
	# 	visit categories_path
	# 	find(:xpath, "//a[@href='#people']").click
	# 	page.should have_content auction.title
	# end
end