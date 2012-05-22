require 'spec_helper'

describe "connections/edit" do
  before(:each) do
    @connection = assign(:connection, stub_model(Connection,
      :strength => 1,
      :num => 1,
      :source_id => 1,
      :target_id => 1,
      :relationship_type => "MyString"
    ))
  end

  it "renders the edit connection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => connections_path(@connection), :method => "post" do
      assert_select "input#connection_strength", :name => "connection[strength]"
      assert_select "input#connection_num", :name => "connection[num]"
      assert_select "input#connection_source_id", :name => "connection[source_id]"
      assert_select "input#connection_target_id", :name => "connection[target_id]"
      assert_select "input#connection_relationship_type", :name => "connection[relationship_type]"
    end
  end
end
