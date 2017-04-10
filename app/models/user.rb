class User < ApplicationRecord
	validates_uniqueness_of :email
	has_secure_password
	has_secure_token :token
	has_secure_token :password_reset_token

	reverse_geocoded_by :latitude, :longitude do |obj,results|
		if geo = results.first
		  obj.place = geo.address
		end
	end
	after_validation :reverse_geocode

	has_many :events , as: :eventby , dependent: :destroy
end
