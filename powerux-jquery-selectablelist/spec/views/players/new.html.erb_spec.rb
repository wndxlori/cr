require 'spec_helper'

describe "players/new.html.erb" do
  before(:each) do
    assign(:player, stub_model(Player,
      :sur_name => "MyString",
      :given_name => "MyString",
      :position => "MyString",
      :team_abbreviation => "MyString",
      :place_of_birth => "MyString"
    ).as_new_record)
  end

  it "renders new player form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => players_path, :method => "post" do
      assert_select "input#player_sur_name", :name => "player[sur_name]"
      assert_select "input#player_given_name", :name => "player[given_name]"
      assert_select "input#player_position", :name => "player[position]"
      assert_select "input#player_team_abbreviation", :name => "player[team_abbreviation]"
      assert_select "input#player_place_of_birth", :name => "player[place_of_birth]"
    end
  end
end
