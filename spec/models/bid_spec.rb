require 'spec_helper'

describe Bid do
  it { should respond_to :time }
  it { should validate_presence_of :time }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :auction_id }
  it { should belong_to :user }
  it { should belong_to :auction }
  it { should belong_to :charity }
end
