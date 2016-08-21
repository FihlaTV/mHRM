require 'rails_helper'

RSpec.describe "positions/new", type: :view do
  before(:each) do
    assign(:position, Position.new(
      :user_id => 1,
      :title => "MyString",
      :position_description => "MyText",
      :location => "MyString",
      :special_requirement => "MyString",
      :note => "MyText",
      :files => "MyString"
    ))
  end

  it "renders new position form" do
    render

    assert_select "form[action=?][method=?]", positions_path, "post" do

      assert_select "input#position_user_id[name=?]", "position[user_id]"

      assert_select "input#position_title[name=?]", "position[title]"

      assert_select "textarea#position_position_description[name=?]", "position[position_description]"

      assert_select "input#position_location[name=?]", "position[location]"

      assert_select "input#position_special_requirement[name=?]", "position[special_requirement]"

      assert_select "textarea#position_note[name=?]", "position[note]"

      assert_select "input#position_files[name=?]", "position[files]"
    end
  end
end
