class JobCategory < ApplicationRecord
    has_many :alumni

    validates :name, presence: true
end
