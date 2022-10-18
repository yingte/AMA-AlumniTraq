# frozen_string_literal: true

require 'application_system_test_case'

class EventAttendeesTest < ApplicationSystemTestCase
  before do
    @event_attendee = event_attendees(:one)
  end

  test 'visiting the index' do
    visit event_attendees_url
    assert_selector 'h1', text: 'Event Attendees'
  end

  test 'creating a Event attendee' do
    visit event_attendees_url
    click_on 'New Event Attendee'

    fill_in 'Event', with: @event_attendee.meeting_id
    fill_in 'User', with: @event_attendee.user_id
    click_on 'Create Event attendee'

    assert_text 'Event attendee was successfully created'
    click_on 'Back'
  end

  test 'updating a Event attendee' do
    visit event_attendees_url
    click_on 'Edit', match: :first

    fill_in 'Event', with: @event_attendee.meeting_id
    fill_in 'User', with: @event_attendee.user_id
    click_on 'Update Event attendee'

    assert_text 'Event attendee was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Event attendee' do
    visit event_attendees_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Event attendee was successfully destroyed'
  end
end
