class Event < ApplicationRecord
	reverse_geocoded_by :latitude, :longitude do |obj,results|
		if geo = results.first
		  obj.place = geo.address
		end
	end
	after_validation :reverse_geocode

	belongs_to :eventby , :polymorphic => true
end
