class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_users

  private
  def set_users
  end
end
