class Photo < ActiveRecord::Base
	validates :name, presence: true
	mount_uploader :image, ImageUploader
end
