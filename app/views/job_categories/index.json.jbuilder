# frozen_string_literal: true

json.array!(@job_categories, partial: 'job_categories/job_category', as: :job_category)
