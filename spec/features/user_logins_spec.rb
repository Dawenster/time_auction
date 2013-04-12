require 'spec_helper'

describe "UserLogins" do

  subject { page }

  describe "logging in" do
    let(:user) { FactoryGirl.create(:user) }
    
    before { visit new_session_path }

    it { should have_content "Log in" }

    context "with valid input" do
      before do
        login_user(user)
      end

      it "should create user" do
        should have_content user.name
      end
    end

    context "with invalid input" do
      before do
        fill_in :session_email, with: "zzzzz"
        fill_in :session_password, with: user.password
        click_button 'Log in'
      end

      it "should not log in" do
        should have_content "Invalid"
      end

      it "should generate error messages" do
        should have_content "Invalid"
      end
    end
  end
end
