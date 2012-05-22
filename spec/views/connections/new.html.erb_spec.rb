require 'spec_helper'

describe "connections/new" do
  before(:each) do
    assign(:connection, stub_model(Connection,
      :strength => 1,
      :num => 1,
      :source_id => 1,
      :target_id => 1,
      :relationship_type => "MyString"
    ).as_new_record)
  end

  it "renders new connection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => connections_path, :method => "post" do
      assert_select "input#connection_strength", :name => "connection[strength]"
      assert_select "input#connection_num", :name => "connection[num]"
      assert_select "input#connection_source_id", :name => "connection[source_id]"
      assert_select "input#connection_target_id", :name => "connection[target_id]"
      assert_select "input#connection_relationship_type", :name => "connection[relationship_type]"
    end
  end
end
