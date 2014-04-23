class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :resource_params, if: :devise_controller?

  def resource_params
    devise_parameter_sanitizer.for(:sign_up) {|user| user.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) {|user| user.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)}
  end
  
  private :resource_params
end