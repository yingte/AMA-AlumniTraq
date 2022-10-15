# password_digest:string => has_secure_password =>
#
# virtual:
#   password:string
#   password_confirmation:string

class User < ApplicationRecord
  has_secure_password

  belongs_to :role
  belongs_to :major
  has_one :alumnus
  has_many :events, through: :event_attendees
  has_many :event_attendees

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a valid email address" }, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :graduation_year, presence: true


  def self.keyword_search(keywords)
    split_keyword = keywords.split
    # Preventing SQL injections 
    keywords = "%" + keywords + "%"

    for x in split_keyword do
      x = "%" + x + "%"
    end

    User.where("first_name LIKE ? AND last_name LIKE ? OR first_name LIKE ? OR last_name LIKE ?", split_keyword[0], split_keyword[1], keywords, keywords)
    User.where("first_name LIKE ? AND last_name LIKE ? OR first_name LIKE ? OR last_name LIKE ? OR
    lower(first_name) LIKE ? AND lower(last_name) LIKE ? OR lower(first_name) LIKE ? OR lower(last_name) LIKE ?",
    split_keyword[0], split_keyword[1], keywords, keywords, split_keyword[0], split_keyword[1], keywords, keywords)
  end
  
end
