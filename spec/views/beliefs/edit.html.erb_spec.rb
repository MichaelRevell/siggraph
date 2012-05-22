require 'spec_helper'

describe "beliefs/edit" do
  before(:each) do
    @belief = assign(:belief, stub_model(Belief,
      :title => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit belief form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => beliefs_path(@belief), :method => "post" do
      assert_select "input#belief_title", :name => "belief[title]"
      assert_select "input#belief_description", :name => "belief[description]"
    end
  end
end
