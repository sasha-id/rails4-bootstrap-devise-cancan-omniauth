class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :check_registration

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private

  def check_registration
    if current_user && !current_user.valid?
      flash[:warning] = "Please finish your #{view_context.link_to "registration", edit_user_registration_url }  before continuing.".html_safe
    end
  end

end
