require 'spec_helper'

describe "connections/index" do
  before(:each) do
    assign(:connections, [
      stub_model(Connection,
        :strength => 1,
        :num => 2,
        :source_id => 3,
        :target_id => 4,
        :relationship_type => "Relationship Type"
      ),
      stub_model(Connection,
        :strength => 1,
        :num => 2,
        :source_id => 3,
        :target_id => 4,
        :relationship_type => "Relationship Type"
      )
    ])
  end

  it "renders a list of connections" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Relationship Type".to_s, :count => 2
  end
end
