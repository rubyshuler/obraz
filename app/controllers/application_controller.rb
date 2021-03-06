class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  serialization_scope :view_context

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
      %i[
        name
        role
      ])
    # update_attrs = %i[
    #   :password
    #   :password_confirmation
    #   :current_password
    # ]
    # devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end
end
