# password_digest:string => has_secure_password =>
#
# virtual:
#   password:string
#   password_confirmation:string

class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2, :facebook, :linkedin]
  has_secure_password

  belongs_to :role
  belongs_to :major
  has_one :alumnus, dependent: :destroy
  has_many :meetings, through: :event_attendees
  has_many :event_attendees

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a valid email address" }, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :graduation_year, presence: true
  
  scope :alumni_users, -> { where(role_id: 3) }
  scope :unapproved_users, -> { where(is_approved: false) }

  def is_admin?
    role_id == 1
  end
  
  def is_member?
    role_id == 2
  end
  
  def is_alumnus?
    role_id == 3
  end
  
  def is_event_planner?
    role_id == 4
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Create new user if they don't exist
    unless user
        user = User.create(first_name: data['first_name'],
          last_name: data['last_name'],
          email: data['email'],
          password: Devise.friendly_token[0,20]
        )
    end

    user
  end
end
