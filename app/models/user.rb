# password_digest:string => has_secure_password =>
#
# virtual:
#   password:string
#   password_confirmation:string

class User < ApplicationRecord
  has_secure_password

  belongs_to :role
  belongs_to :major
  has_one :alumnus, dependent: :destroy
  has_many :events, through: :event_attendees
  has_many :event_attendees

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a valid email address" }, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :graduation_year, presence: true
  
  scope :alumni_users, -> { where(role_id: 3) }
end
