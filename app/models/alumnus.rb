class Alumnus < ApplicationRecord
    belongs_to :user
    belongs_to :job_category
    belongs_to :employer
    has_many :media_handles
end
