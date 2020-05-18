# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    case resource.role
    when 'designer'
      new_designer_path
    when 'customer'
      root_path
    end
  end
end
