# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('event_attendees/new', type: :view) do
  before do
    assign(:event_attendee, EventAttendee.new(
                              meeting_id: 1,
                              user_id: 1
                            )
    )
  end

  it 'renders new event_attendee form' do
    render

    assert_select 'form[action=?][method=?]', event_attendees_path, 'post' do
      assert_select 'select[name=?]', 'event_attendee[meeting_id]'

      assert_select 'select[name=?]', 'event_attendee[user_id]'
    end
  end
end
