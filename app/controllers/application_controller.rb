class ApplicationController < ActionController::Base
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to home_splash_path
    end
  end
end
