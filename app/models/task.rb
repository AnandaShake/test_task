class Task < ApplicationRecord
	mount_uploaders :files, FileUploader
	has_many :users, through: :user_assigns
	has_many :task_tags
	validates :name, presence: true
	validates :description, presence: true
end
