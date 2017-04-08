class QariController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :restrict_qari , only: []


	def signup
		em = params[:qari][:email].downcase
		if Qari.exists?(email: em)
			render json: {'message' => 'Already signedup!'} , status: 409
		else
			qari = Qari.new(signu_params)
			qari.email = em
			if qari.save
				render json: {'message' => 'Kindly Signin'} , status: 201
			else
				render json: {'message' => 'Something went wrong'} , status: 422
			end
		end
	end

	def signin
		em = params[:qari][:email].downcase
		if Qari.exists?(email: em)
			if @qari = Qari.find_by(email: em).try(:authenticate, params[:qari][:password] )
				render status: 200
			else
				@message = 'Invalid email/password'
				render status: 409
			end
		else
			@message = 'Kindly Signup'
			render status: 422
		end
	end

	private

	def signu_params
		params.require(:qari).permit(:name , :email , :password , :mobile_number , :dob , :gender , :qualification , :latitude , :longitude , :hourly_rate , :awards)
	end
end
