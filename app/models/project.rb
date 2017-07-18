class Project < ApplicationRecord
	has_many :tasklists
	validates :name, presence: true
end
