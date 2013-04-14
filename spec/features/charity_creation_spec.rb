require 'spec_helper'

describe "Charity Creation" do
  before { login_user(user) }
  let(:user) { FactoryGirl.create(:user, :admin => true) }
  subject { page }

  it "can create a charity" do
    expect {
      visit new_charity_path
      fill_in :charity_name, with: Faker::Name.name
      fill_in :charity_description, with: Faker::Lorem.paragraph
      click_button 'Create Charity'
    }.to change(Charity, :count).by(1)
  end

  it "does not create a charity with invalid input" do
    expect {  
      visit new_charity_path
      click_button 'Create Charity'
    }.not_to change(Charity, :count)
  end

  it "should throw an error if invalid" do
    visit new_charity_path
    click_button 'Create Charity'
    should have_selector '.alert-errors'
  end
end

describe "Charity Creation" do
  before { login_user(user) }
  let(:charity) { FactoryGirl.create(:charity) }
  let(:user) { FactoryGirl.create(:user, :admin => true) }
  subject { page }

  it "can edit a charity" do
    visit edit_charity_path(charity)
    fill_in :charity_name, with: "New name"
    click_button 'Update Charity'
    should have_content "New name"
  end

  it "does not save a charity if edited with an empty title" do
    visit edit_charity_path(charity)
    fill_in :charity_name, with: ""
    click_button 'Update Charity'
    should have_selector '.alert-errors'
  end
end
