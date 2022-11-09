# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('event_attendees/edit', type: :view) do
  meeting = get_meeting
  user = get_member_user

  let(:event_attendee) do
    EventAttendee.find_or_create_by!(
      meeting_id: meeting.id,
      user_id: user.id
    )
  end

  before do
    assign(:event_attendee, event_attendee)
  end

  it 'renders the edit event_attendee form' do
    render

    assert_select 'form[action=?][method=?]', event_attendee_path(event_attendee), 'post' do
      assert_select 'select[name=?]', 'event_attendee[meeting_id]'

      assert_select 'select[name=?]', 'event_attendee[user_id]'
    end
  end
end
