require 'rails_helper'

RSpec.describe "calendarevents/new", type: :view do
  before(:each) do
    assign(:calendarevent, Calendarevent.new(
      title: "MyString",
      calendar_id: 1,
      location: "MyString"
    ))
  end

  it "renders new calendarevent form" do
    render

    assert_select "form[action=?][method=?]", calendarevents_path, "post" do

      assert_select "input[name=?]", "calendarevent[title]"

      assert_select "input[name=?]", "calendarevent[calendar_id]"

      assert_select "input[name=?]", "calendarevent[location]"
    end
  end
end
