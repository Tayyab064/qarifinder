class Event < ApplicationRecord
	geocoded_by :place
	after_validation :geocode

	belongs_to :eventby , :polymorphic => true
end
