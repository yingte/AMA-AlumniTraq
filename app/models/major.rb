# frozen_string_literal: true

class Major < ApplicationRecord
  has_many :users, dependent: :nullify

  validates :name, presence: true
end
