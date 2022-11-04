require 'rails_helper'

RSpec.describe "event_attendees/show", type: :view do
  meeting = get_meeting()
  user = get_member_user()
  
  before(:each) do
    assign(:event_attendee, EventAttendee.create!(
      meeting_id: meeting.id,
      user_id: user.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{meeting.name}/)
    expect(rendered).to match(/#{user.first_name}/)
  end
end
