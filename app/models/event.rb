class Event < ApplicationRecord
    has_many :users, through: :event_attendees
    has_many :event_attendees
end
