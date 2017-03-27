json.qaris(@qari) do |qari|
	json.id qari.id
	json.name qari.name
	json.email qari.email
	json.mobile_number qari.mobile_number
	json.address qari.address
	json.latitude qari.latitude
	json.longitude qari.longitude
	json.dob qari.dob
	json.gender qari.gender
	json.qualification qari.qualification
	json.timeslots(qari.timeslots) do |slot|
		json.timeslot slot.timeslot
		json.day slot.dayslot
	end
end