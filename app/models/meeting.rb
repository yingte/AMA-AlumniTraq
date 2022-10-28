# frozen_string_literal: true

class Meeting < ApplicationRecord
  has_many :event_attendees, dependent: :destroy
  has_many :users, through: :event_attendees
end
