# frozen_string_literal: true

class Alumnus < ApplicationRecord
  include Filterable

  belongs_to :user
  belongs_to :job_category, optional: true
  has_many :media_handles, dependent: :destroy
  has_one_attached :image

  def image_as_thumbnail
    image.variant(resize_to_limit: [250, 250]).processed
  end

  def job_category_name_if_present
    job_category.name if job_category.present?
  end
end
