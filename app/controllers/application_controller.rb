class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_user

  private

  def current_user
    @__user ||= User.find_by_uid(session[:uid])
    redirect_to '/auth/wechat' unless @__user
  end

  def set_current_user(user)
    session[:uid] = user.uid
  end
end
