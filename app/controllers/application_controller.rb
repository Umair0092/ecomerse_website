class ApplicationController < ActionController::Base
  include Authentication
  helper_method :current_user
  add_flash_types :success, :error, :info, :warning
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  private
  def current_user
    @current_user ||=User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
