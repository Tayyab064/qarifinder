if @message.present?
	json.message @message
else
	json.user do
		json.email @user.email
		json.mobile_number @user.mobile_number
		json.name @user.name
		json.address @user.address
		json.latitude @user.latitude
		json.longitude @user.longitude
		json.token @user.token
		if @user.image_url.present?
			json.image @user.image_url
		else
			json.image ''
		end
	end
end