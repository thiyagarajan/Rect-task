class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  skip_before_filter :authenticate_user!

  def all
    auth = env["omniauth.auth"]
    user = User.from_omniauth(env["omniauth.auth"], current_user)
    unless user.nil?
      if user.persisted?
        sign_in(:user, user)
        if user.sign_in_count == 1
          redirect_to root_path
        else
          redirect_to root_path
        end
      else
        session["devise.user_attributes"] = user.attributes
        redirect_to signup_path
      end
    else
      redirect_to root_path
      flash[:error] = 'Could not authenticate you from Facebook because system suspended". Please contact contact@moorem.com!'
    end
  end

  def failure
    super
  end

  alias_method :facebook, :all

end