require 'spec_helper'

describe "UserSignups" do

  subject { page }

  describe "signing up" do
    before { visit new_user_path }

    it { should have_content "Create an Account" }

    context "with valid input" do
      before do
        fill_in :user_name, with: "Test Name"
        fill_in :user_email, with: "j@example.com"
        fill_in :user_phone, with: "310-333-3333"
        fill_in :user_password, with: "Password1"
      end

      it "should create user" do
        expect {click_button "Sign Up" }.to change(User, :count).by(1)
      end
    end

    context "with invalid input" do
      subject { page }

      before do
        fill_in :user_name, with: "Test Name"
        fill_in :user_email, with: "j@example.com"
        fill_in :user_phone, with: "310-333-3333"
      end

      it "should not create user" do
        expect {click_button "Sign Up" }.not_to change(User, :count)
      end

      it "should generate error messages" do
        click_button 'Sign Up'
        should have_selector '.alert-errors'
      end
    end
  end
end
