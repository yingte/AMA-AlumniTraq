# frozen_string_literal: true

class EventAttendee < ApplicationRecord
  belongs_to :meeting
  belongs_to :user
end
