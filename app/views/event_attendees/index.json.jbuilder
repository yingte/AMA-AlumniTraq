# frozen_string_literal: true

json.array!(@event_attendees, partial: 'event_attendees/event_attendee', as: :event_attendee)
