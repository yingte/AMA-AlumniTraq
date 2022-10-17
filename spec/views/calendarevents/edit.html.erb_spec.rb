require 'rails_helper'

RSpec.describe "calendarevents/edit", type: :view do
  before(:each) do
    @calendarevent = assign(:calendarevent, Calendarevent.create!(
      title: "MyString",
      calendar_id: 1,
      location: "MyString"
    ))
  end

  it "renders the edit calendarevent form" do
    render

    assert_select "form[action=?][method=?]", calendarevent_path(@calendarevent), "post" do

      assert_select "input[name=?]", "calendarevent[title]"

      assert_select "input[name=?]", "calendarevent[calendar_id]"

      assert_select "input[name=?]", "calendarevent[location]"
    end
  end
end
