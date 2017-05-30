class QariMailer < ApplicationMailer

	def send_email(user)
		@user = user
    	@url  = 'https://qarifinder.herokuapp.com'
    	mail(to: @user.email, subject: 'QariFinder', body: 'Welcome '+ @user.name + '. Please click on link to verify email: https://qarifinder.herokuapp.com/qari/email/verify/' + @user.email_token )
	end
end
