class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    identity = Identity.from_omniauth(request.env["omniauth.auth"])
    user = identity.find_or_create_user(current_user)

    if user.valid?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
      sign_in user
      redirect_to edit_user_registration_url
    end
  end

  alias_method :facebook, :all
  alias_method :twitter, :all
end