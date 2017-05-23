class EventController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :restrict_all , only: []

	def event
		c = Event.new(event_params)
		if c.save
			render json: {'message' => 'Successfully created'} , status: 201
		else
			render json: {'message' => c.errors} , status: 422
		end
	end


	private

	def event_params
		params.require(:event).permit(:timing , :title , :orginazior , :contact_number , :latitude , :longitude , :description , :image)
	end
end
