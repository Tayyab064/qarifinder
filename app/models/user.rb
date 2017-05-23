class User < ApplicationRecord
	validates_uniqueness_of :email
	has_secure_password
	has_secure_token :token
	has_secure_token :password_reset_token

	mount_uploader :image, ImageUploader

	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode

end
