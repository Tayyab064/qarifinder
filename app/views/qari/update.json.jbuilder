json.qari do
	json.email @current_qari.email
	json.mobile_number @current_qari.mobile_number
	json.name @current_qari.name
	json.address @current_qari.address
	if @current_qari.dob.present?
		json.dob @current_qari.dob.strftime('%d-%m-%Y')
	else
		json.dob ''
	end
	json.gender @current_qari.gender
	json.qualification @current_qari.qualification
	json.hourly_rate @current_qari.hourly_rate
	json.awards @current_qari.awards
	json.experience @current_qari.experience
	json.latitude @current_qari.latitude
	json.longitude @current_qari.longitude
	json.token @current_qari.token
	if @current_qari.image_url.present?
		json.image @current_qari.image_url
	else
		json.image ''
	end
	json.timeslot(@current_qari.timeslots) do |timi|
		json.id timi.id
		json.timeslot timi.timeslot
		json.dayslot timi.dayslot
	end
end