class Task < ApplicationRecord
	has_many :users, through: :user_assigns
end
