# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
    resource.shopping_cart = ShoppingCart.create(user_id: resource.id)
  end

  def after_sign_up_path_for(resource)
    case resource.role
    when 'designer'
      new_designer_path
    when 'customer'
      root_path
    end
  end
end
