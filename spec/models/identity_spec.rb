require 'spec_helper'

describe Identity do
  it { should validate_presence_of :provider }
  it { should belong_to :user }
  
end
