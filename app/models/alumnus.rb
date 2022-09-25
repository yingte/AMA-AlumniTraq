class Alumnus < ApplicationRecord
    belongs_to :user
    has_many :media_handles
end
