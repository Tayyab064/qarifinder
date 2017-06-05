Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope 'api' do
  	scope 'user' do
	  	post 'signup' => 'user#signup'
	  	post 'signin' => 'user#signin'
	  	get 'nearby' => 'user#nearby_qari'
	  	get 'events/nearby' => 'user#nearby_events'
	  	get 'events' => 'user#events'
	  	put 'dp' => 'user#upload_image'
	end

	scope 'qari' do
		post 'signup' => 'qari#signup'
		post 'signin' => 'qari#signin'
		put 'dp' => 'qari#upload_image'

		patch 'update' => 'qari#update'
		post 'forget_password' => 'qari#forget_password'
	end

	post 'event' => 'event#event'
  end

  get 'qari/email/verify/:token' => 'qari#verify_email'
  get 'qari/password/reset/:token' => 'qari#reset_password'
  put 'qari/update_password' => 'qari#update_password_for'

end