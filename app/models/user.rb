class User < ApplicationRecord
  include Clearance::User
  has_many :tasks, through: :user_assigns
  validates :email, presence: true,
  					uniqueness: true
  validates	:password, length: { in: 6..20 }

end
