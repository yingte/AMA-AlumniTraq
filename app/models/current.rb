class Current < ActiveSupport::CurrentAttributes
    attribute :user
    attribute :previous_path
    attribute :current_path
end