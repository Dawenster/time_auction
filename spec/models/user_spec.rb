require 'spec_helper'

describe User do
  it { should validate_presence_of :name }
  it { should respond_to :name }
  it { should validate_presence_of :email }
  it { should respond_to :email }
  it { should validate_uniqueness_of :email }
  it { should respond_to :phone }

  describe "valid email" do
    let(:user) { FactoryGirl.create(:user) }

    it "should accept david@gmail.com" do
      expect {
        FactoryGirl.create(:user)
      }.to change(User, :count).by(1)
    end

    it "should not accept jay@134r.c" do
      expect {
        User.create(name:"J", password:"password", phone: "310-433-3333", email: 'jay@134r.c')
      }.to_not change(User, :count)
    end
  end

  describe "valid phone number" do
    it "should accept 415-361-6651" do
      expect {
        FactoryGirl.create(:user)
      }.to change(User, :count).by(1)
    end

    it "should not accept 498572" do
      expect {
        User.create(name:"J", password:"password", phone: "498572", email: 'jay@gmail.com')
      }.to_not change(User, :count)
    end

    it "should not accept 'I don't want to give this to you'" do
      expect {
        User.create(name:"J", password:"password", phone: "I don't want to give this to you", email: 'jay@gmail.com')
      }.to_not change(User, :count)
    end
  end
end
