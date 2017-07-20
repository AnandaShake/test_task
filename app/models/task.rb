class Task < ApplicationRecord
	mount_uploaders :files, FileUploader
	has_many :users, through: :user_assigns
end
