class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :update_last_seen

  private
    
    def update_last_seen
      if signed_in? && (current_user.last_seen.nil? || (DateTime.now - 1.day) < current_user.last_seen)
        current_user.last_seen = DateTime.now
        current_user.save
      end
    end
end
