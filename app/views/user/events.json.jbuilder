json.events(@event) do |event|
	json.id event.id
	json.place event.place
	json.timing event.timing
	json.title event.title
	json.orginazior event.orginazior
	json.contact_number event.contact_number
	json.latitude event.latitude
	json.longitude event.longitude
	user = event.user
	json.user do
		json.name user.name
		json.address user.address
		json.mobile_number user.mobile_number
		json.email user.email
	end
end