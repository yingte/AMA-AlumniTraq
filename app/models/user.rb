class User < ApplicationRecord
  belongs_to :role
  has_one :alumnus
  has_many :events, through: :event_attendees
  has_many :event_attendees

  validates :first_name, :last_name, :major, :graduation_year, :email, :phone, presence: true
end
