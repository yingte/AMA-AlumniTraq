class Current < ActiveSupport::CurrentAttributes
    attribute :user
    attribute :previous_path
    attribute :previous_search
end