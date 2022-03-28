# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  helper_method :logged_in?, :current_user, :authenticate_user
  def current_user
    current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user
    unless logged_in?
      flash[:danger] = 'You must logged in to perform this action'
      redirect_to root_path, status: 303
    end
  end
end
