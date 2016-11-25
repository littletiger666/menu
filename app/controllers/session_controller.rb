class SessionController < ApplicationController
  skip_before_action :current_user

  def create
    auth = request.env['omniauth.auth']
    if auth[:uid] && auth[:info]
      user = User.where(uid: auth[:uid]).first_or_create
      user.update_attributes(user_attrs(auth))
      set_current_user(user)
      redirect_to user_path(user)
    else
      render :failure
    end
  end

  def destroy
  end

  def failure
  end

  private

  def user_attrs(auth)
    {
      uid: auth[:uid],
      name: auth[:info][:nickname],
      sex: auth[:info][:sex],
      avatar: auth[:info][:headimgurl],
      country: auth[:info][:country],
      provice: auth[:info][:provice],
      city: auth[:info][:city]
    }
  end
end
