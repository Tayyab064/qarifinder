class EventController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :restrict_all , only: [:event]

	def event
		c = Event.new(event_params)
		if @user.class == 'Qari'
			c.eventby_type = 'Qari'
		else
			c.eventby_type = 'User'
		end
		c.eventby_id = @user.id
		if c.save
			render json: {'message' => 'Successfully created'} , status: 201
		else
			render json: {'message' => c.errors} , status: 422
		end
	end


	private

	def event_params
		params.require(:event).permit(:timing , :title , :orginazior , :contact_number , :latitude , :longitude)
	end
end
