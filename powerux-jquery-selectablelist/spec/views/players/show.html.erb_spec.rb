require 'spec_helper'

describe "players/show.html.erb" do
  before(:each) do
    @player = assign(:player, stub_model(Player,
      :sur_name => "Sur Name",
      :given_name => "Given Name",
      :position => "Position",
      :team_abbreviation => "Team Abbreviation",
      :place_of_birth => "Place Of Birth"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Sur Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Given Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Position/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Team Abbreviation/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Place Of Birth/)
  end
end
