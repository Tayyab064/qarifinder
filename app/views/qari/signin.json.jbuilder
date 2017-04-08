if @message.present?
	json.message @message
else
	json.qari do
		json.email @qari.email
		json.mobile_number @qari.mobile_number
		json.name @qari.name
		json.address @qari.address
		json.latitude @qari.latitude
		json.longitude @qari.longitude
		json.token @qari.token
	end
end