class QariController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :restrict_qari , only: [ :upload_image]


	def signup
		em = params[:qari][:email].downcase
		if Qari.exists?(email: em)
			render json: {'message' => 'Already signedup!'} , status: 409
		else
			qari = Qari.new(signu_params)
			qari.email = em
			if qari.save
				params[:qari][:timeslot].split(',').each do |spl|
					dis = spl.split('+')
					Timeslot.create(timeslot: dis[1], dayslot: dis[0], qari_id: qari.id)
				end
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

	def upload_image
		if params[:image].present?
			@current_qari.update(image: params[:image])
			message = 'Profile pic updated'
			sta = 200
		else
			message = 'Params missing'
			sta = 422
		end
		render json: {'message' => message} , status: sta
	end

	private

	def signu_params
		params.require(:qari).permit(:name , :email , :password , :mobile_number , :dob , :gender , :description , :qualification , :latitude , :longitude , :hourly_rate , :awards)
	end
end
