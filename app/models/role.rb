class Role < ApplicationRecord
    has_many :permissions, through: :role_permissions
    has_many :role_permissions
    has_many :users

    validates :name, presence: true
end
