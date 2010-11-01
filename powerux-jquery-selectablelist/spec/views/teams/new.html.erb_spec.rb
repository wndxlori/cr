require 'spec_helper'

describe "teams/new.html.erb" do
  before(:each) do
    assign(:team, stub_model(Team,
      :name => "MyString",
      :abbreviation => "MyString",
      :hometown => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ).as_new_record)
  end

  it "renders new team form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => teams_path, :method => "post" do
      assert_select "input#team_name", :name => "team[name]"
      assert_select "input#team_abbreviation", :name => "team[abbreviation]"
      assert_select "input#team_hometown", :name => "team[hometown]"
      assert_select "input#team_latitude", :name => "team[latitude]"
      assert_select "input#team_longitude", :name => "team[longitude]"
    end
  end
end
