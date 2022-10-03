class Alumnus < ApplicationRecord
    include Filterable

    belongs_to :user
    has_many :media_handles
end
