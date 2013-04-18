require 'spec_helper'

describe "Category index page" do
	let!(:auction) {FactoryGirl.create(:auction)}
	before do
		visit categories_path
	end

	it "should display "
end