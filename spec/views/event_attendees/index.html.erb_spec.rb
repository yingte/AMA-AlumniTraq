# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('event_attendees/index', type: :view) do
  alumnus_user1 = User.find_or_create_by!(
    email: 'thegoodag@gmail.com',
    role_id: 3,
    first_name: 'Ole',
    last_name: 'Rock',
    major_id: 65,
    graduation_year: 1954,
    phone: '',
    is_approved: false
  )
  alumnus_user2 = User.find_or_create_by!(
    email: 'byron.henderson@gmail.com',
    role_id: 3,
    first_name: 'Byron',
    last_name: 'Henderson',
    major_id: 10,
    graduation_year: 2003,
    phone: '',
    is_approved: false
  )
  meeting1 = Meeting.find_or_create_by!(
    name: 'Test Meeting1',
    start_time: 'Thu, 03 Nov 2022 23:40:00.000000000 CDT -05:00',
    end_time: 'Thu, 03 Nov 2022 23:59:00.000000000 CDT -05:00',
    description: 'Test description 1'
  )
  meeting2 = Meeting.find_or_create_by!(
    name: 'Test Meeting2',
    start_time: 'Thu, 04 Nov 2022 23:40:00.000000000 CDT -05:00',
    end_time: 'Thu, 04 Nov 2022 23:59:00.000000000 CDT -05:00',
    description: 'Test description 2'
  )

  before do
    assign(:event_attendees, [
      EventAttendee.find_or_create_by!(
        meeting_id: meeting1.id,
        user_id: alumnus_user1.id
      ),
      EventAttendee.find_or_create_by!(
        meeting_id: meeting1.id,
        user_id: alumnus_user2.id
      ),
      EventAttendee.find_or_create_by!(
        meeting_id: meeting2.id,
        user_id: alumnus_user1.id
      ),
      EventAttendee.find_or_create_by!(
        meeting_id: meeting2.id,
        user_id: alumnus_user2.id
      )
    ]
    )
  end

  it 'renders a list of event_attendees' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(meeting1.name.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(alumnus_user1.first_name.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(meeting2.name.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(alumnus_user2.first_name.to_s), count: 2
  end
end
