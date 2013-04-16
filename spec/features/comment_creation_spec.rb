require 'spec_helper'

describe "User creating a comment", js: true do
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

  describe "when passing a valid and successful comment" do
    before do
      page.fill_in('comment_content', :with => "That's so Rails")
      click_button('Add Comment')
      page.fill_in('comment_content', :with => "#PrayForKobe")
      click_button('Add Comment')
    end

    it "should accept comment if greater than 0 characters" do
      page.should have_content('#PrayForKobe')
    end

    it "should show up at the top" do
      page.find('#commentsTab').click
      page.should have_selector('ul.comments .commentBlock .comment p', text: "#PrayForKobe")
    end
  end

  it "should yield error if invalid" do
    click_button('Add Comment')
    page.should have_content("blank")
  end
end

