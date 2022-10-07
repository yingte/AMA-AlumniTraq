require 'rails_helper'

RSpec.describe "calendarevents/index", type: :view do
  before(:each) do
    assign(:calendarevents, [
      Calendarevent.create!(
        title: "Title",
        calendar_id: 2,
        location: "Location"
      ),
      Calendarevent.create!(
        title: "Title",
        calendar_id: 2,
        location: "Location"
      )
    ])
  end

  it "renders a list of calendarevents" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Location".to_s, count: 2
  end
end
