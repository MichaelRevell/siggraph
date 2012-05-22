require 'spec_helper'

describe "beliefs/new" do
  before(:each) do
    assign(:belief, stub_model(Belief,
      :title => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new belief form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => beliefs_path, :method => "post" do
      assert_select "input#belief_title", :name => "belief[title]"
      assert_select "input#belief_description", :name => "belief[description]"
    end
  end
end
