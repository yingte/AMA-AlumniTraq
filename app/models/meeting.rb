class Meeting < ApplicationRecord
    has_many :event_attendees
    has_many :users, through: :event_attendees
end
