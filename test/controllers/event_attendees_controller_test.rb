# frozen_string_literal: true

require 'test_helper'

class EventAttendeesControllerTest < ActionDispatch::IntegrationTest
  # before do
  #   @event_attendee = event_attendees(:one)
  # end

  test 'should get index' do
    get event_attendees_url
    assert_response :success
  end

  test 'should get new' do
    get new_event_attendee_url
    assert_response :success
  end

  test 'should create event_attendee' do
    @event_attendee = event_attendees(:one)
    assert_difference('EventAttendee.count') do
      post event_attendees_url,
           params: { event_attendee: { meeting_id: @event_attendee.meeting_id, user_id: @event_attendee.user_id } }
    end

    assert_redirected_to event_attendee_url(EventAttendee.last)
  end

  test 'should show event_attendee' do
    @event_attendee = event_attendees(:one)
    get event_attendee_url(@event_attendee)
    assert_response :success
  end

  test 'should get edit' do
    @event_attendee = event_attendees(:one)
    get edit_event_attendee_url(@event_attendee)
    assert_response :success
  end

  test 'should update event_attendee' do
    @event_attendee = event_attendees(:one)
    patch event_attendee_url(@event_attendee),
          params: { event_attendee: { meeting_id: @event_attendee.meeting_id, user_id: @event_attendee.user_id } }
    assert_redirected_to event_attendee_url(@event_attendee)
  end

  test 'should destroy event_attendee' do
    @event_attendee = event_attendees(:one)
    assert_difference('EventAttendee.count', -1) do
      delete event_attendee_url(@event_attendee)
    end

    assert_redirected_to event_attendees_url
  end
end
