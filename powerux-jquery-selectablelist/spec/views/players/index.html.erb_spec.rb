require 'spec_helper'

describe "players/index.html.erb" do
  before(:each) do
    assign(:players, [
      stub_model(Player,
        :sur_name => "Sur Name",
        :given_name => "Given Name",
        :position => "Position",
        :team_abbreviation => "Team Abbreviation",
        :place_of_birth => "Place Of Birth"
      ),
      stub_model(Player,
        :sur_name => "Sur Name",
        :given_name => "Given Name",
        :position => "Position",
        :team_abbreviation => "Team Abbreviation",
        :place_of_birth => "Place Of Birth"
      )
    ])
  end

  it "renders a list of players" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sur Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Given Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Position".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Team Abbreviation".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Place Of Birth".to_s, :count => 2
  end
end
