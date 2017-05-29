if @message.present?
	json.message @message
else
	json.qari do
		json.email @qari.email
		json.mobile_number @qari.mobile_number
		json.name @qari.name
		json.address @qari.address
		json.dob @qari.dob.strftime('%d-%m-%Y')
		json.gender @qari.gender
		json.qualification @qari.qualification
		json.hourly_rate @qari.hourly_rate
		json.awards @qari.awards
		json.experience @qari.experience
		json.latitude @qari.latitude
		json.longitude @qari.longitude
		json.token @qari.token
		if @qari.image_url.present?
			json.image @qari.image_url
		else
			json.image ''
		end
		json.timeslot(@qari.timeslots) do |timi|
			json.id timi.id
			c = timi.timeslot.split('to')
			json.time_start c[0]
			json.time_end c[1]
			json.dayslot timi.dayslot
		end
	end
end