class Photo < ActiveRecord::Base
	validates :name, presence: true
	mount_uploader :image, ImageUploader

	  belongs_to :user
end
