class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def restrict_user
    restrict_access_to_user || render_unauthorized
  end

  def restrict_access_to_user
    authenticate_or_request_with_http_token do |token, _options|
      if User.exists?(token: token)
        @current_user = User.find_by_token(token)
      end
    end
  end
end
