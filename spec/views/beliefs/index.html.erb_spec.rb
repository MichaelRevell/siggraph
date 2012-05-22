require 'spec_helper'

describe "beliefs/index" do
  before(:each) do
    assign(:beliefs, [
      stub_model(Belief,
        :title => "Title",
        :description => "Description"
      ),
      stub_model(Belief,
        :title => "Title",
        :description => "Description"
      )
    ])
  end

  it "renders a list of beliefs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
