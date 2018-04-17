class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :is_user_logged_in?
  def index

  end

  def current_user
	#complete this method
  end

  def is_user_logged_in?
	#complete this method
  logged_in = User.find_by_id(session[:current_user_id])
  controller = params[:controller]
  action = params[:action]
  if (controller == "sessions" and action == "new") or (controller == "sessions" and action == "create")
    return true
  elsif (controller == "registrations" and action == "new") or (controller == "registrations" and action == "new")
    return true

  elsif logged_in then true

  else
    redirect_to root_url
  end
  end
end
