require 'rails_helper'

RSpec.describe "calendarevents/show", type: :view do
  before(:each) do
    @calendarevent = assign(:calendarevent, Calendarevent.create!(
      title: "Title",
      calendar_id: 2,
      location: "Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Location/)
  end
end
