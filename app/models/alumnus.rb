class Alumnus < ApplicationRecord
    include Filterable

    belongs_to :user
    belongs_to :job_category
    has_many :media_handles
    has_one_attached :image

    def image_as_thumbnail
        image.variant(resize_to_limit: [250, 250]).processed
    end
end
