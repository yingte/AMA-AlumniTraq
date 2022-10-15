class User < ApplicationRecord
  belongs_to :role
  has_one :alumnus
  has_many :meetings, through: :event_attendees
  has_many :event_attendees
end
