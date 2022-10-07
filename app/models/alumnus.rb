class Alumnus < ApplicationRecord
    include Filterable

    belongs_to :user
    belongs_to :job_category
    has_many :media_handles
    
end
