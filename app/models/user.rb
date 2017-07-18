class User < ApplicationRecord
  include Clearance::User
  validates :email, presence: true,
  					uniqueness: true
  validates	:password, length: { in: 6..20 }

end
