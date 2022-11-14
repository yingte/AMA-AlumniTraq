# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :users, dependent: :nullify

  validates :name, presence: true

  scope :unprivileged, -> { where('NOT id = 1 AND NOT id = 4') }
  # Ex:- scope :active, -> {where(:active => true)}
end
