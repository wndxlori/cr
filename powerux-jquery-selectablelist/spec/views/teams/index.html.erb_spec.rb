require 'spec_helper'

describe "teams/index.html.erb" do
  before(:each) do
    assign(:teams, [
      stub_model(Team,
        :name => "Name",
        :abbreviation => "Abbreviation",
        :hometown => "Hometown",
        :latitude => 1.5,
        :longitude => 2.5
      ),
      stub_model(Team,
        :name => "Name",
        :abbreviation => "Abbreviation",
        :hometown => "Hometown",
        :latitude => 1.5,
        :longitude => 2.5
      )
    ])
  end

  it "renders a list of teams" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Abbreviation".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Hometown".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
  end
end
