# frozen_string_literal: true

class JobCategory < ApplicationRecord
  has_many :alumni, dependent: :nullify

  validates :name, presence: true
end
