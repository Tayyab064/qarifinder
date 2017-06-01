class UserController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :restrict_user , only: [:upload_image]


	def signup
		em = params[:user][:email].downcase
		if User.exists?(email: em)
			render json: {'message' => 'Already signedup!'} , status: 422
		else
			user = User.new(signu_params)
			user.email = em
			if user.save
				render json: {'message' => 'Kindly Signin'} , status: 201
			else
				render json: {'message' => 'Something went wrong'} , status: 422
			end
		end
	end

	def signin
		em = params[:user][:email].downcase
		if User.exists?(email: em)
			if @user = User.find_by(email: em).try(:authenticate, params[:user][:password] )
				render status: 200
			else
				@message = 'Invalid email/password'
				render status: 422
			end
		else
			@message = 'Kindly Signup'
			render status: 422
		end
	end

	def nearby_qari
		if params[:latitude].present? && params[:longitude].present?
			@qari = Qari.where(email_verified: true).near([params[:latitude], params[:longitude]], 5, :units => :km)
		else
			@qari = Qari.where(email_verified: true)
		end
		render status: 200
	end

	def nearby_events
		if params[:latitude].present? && params[:longitude].present?
			@event = Event.where('timing > ?' , Time.now).near([params[:latitude], params[:longitude]], 5, :units => :km)
		else
			@event = Event.where('timing > ?' , Time.now).order(timing: 'ASC')
		end
		render status: 200
	end

	def events
		@event = Event.where('timing > ?' , Time.now).order(timing: 'ASC')
		render status: 200
	end

	def upload_image
		if params[:image].present?
			@current_user.update(image: params[:image])
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
		params.require(:user).permit(:name , :mobile_number , :email , :password , :latitude , :longitude)
	end 
end
