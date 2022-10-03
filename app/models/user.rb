class User < ApplicationRecord
  include Filterable

  belongs_to :role
  has_one :alumnus
  has_many :events, through: :event_attendees
  has_many :event_attendees
end
