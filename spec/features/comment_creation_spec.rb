require 'spec_helper'

describe "User creates a comment", js: true do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:auction) { FactoryGirl.create(:auction) }
  before do
    login_user(user)
    visit auction_path(auction)
    page.find('#commentsTab').click
  end
  it "button should appear if logged in" do
    page.should have_selector('#new_comment')
  end

  # it "should accept comment if greater than 0 characters" do
  #   page.fill_in('comment_content', :with => "Jizzandthepuss")
  #   click_button('Add Comment')
  #   sleep 1
  #   page.should have_content('Jizzandthepuss')
  # end

  # it "should yield error if invalid" do
  # end
end

