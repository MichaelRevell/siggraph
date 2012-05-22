require 'spec_helper'

describe "connections/show" do
  before(:each) do
    @connection = assign(:connection, stub_model(Connection,
      :strength => 1,
      :num => 2,
      :source_id => 3,
      :target_id => 4,
      :relationship_type => "Relationship Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/Relationship Type/)
  end
end
