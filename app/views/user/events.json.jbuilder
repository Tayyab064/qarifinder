json.events(@event) do |event|
	json.id event.id
	json.place event.place
	json.timing event.timing.strftime("%d %b,%Y  %I:%M %p")  
	json.title event.title
	json.description event.description
	json.orginazior event.orginazior
	json.contact_number event.contact_number
	if event.image_url.present?
		json.image event.image_url
	else
		json.image ''
	end
	json.latitude event.latitude
	json.longitude event.longitude
	user = event.eventby
	json.user do
		json.name user.name
		json.address user.address
		json.mobile_number user.mobile_number
		json.email user.email
	end
end