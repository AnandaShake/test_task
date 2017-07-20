class Task < ApplicationRecord
	mount_uploader :file, FileUploader
	has_many :users, through: :user_assigns
end
