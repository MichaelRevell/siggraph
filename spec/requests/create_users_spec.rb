require 'spec_helper'

describe "CreateUsers" do
  it "creates user" do
    u = User.new
    u.name = "bob"
    u.name.should eq("bob")
  end
end
