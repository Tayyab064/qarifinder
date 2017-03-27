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
	end
end