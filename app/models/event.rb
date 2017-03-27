class Event < ApplicationRecord
	belongs_to :user

	geocoded_by :place
	after_validation :geocode
end
