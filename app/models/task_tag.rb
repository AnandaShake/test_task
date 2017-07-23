class TaskTag < ApplicationRecord
	belongs_to :task
	validates :tag, presence: true
end
