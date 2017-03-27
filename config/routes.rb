Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope 'api' do
  	scope 'user' do
	  	post 'signup' => 'user#signup'
	  	post 'signin' => 'user#signin'
	  	get 'nearby' => 'user#nearby_qari'
	  	get 'events/nearby' => 'user#nearby_events'
	  	get 'events' => 'user#events'
	end
  end

end