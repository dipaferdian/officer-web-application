# frozen_string_literal: true

module CurrentUser
  extend ActiveSupport::Concern
  include JwtValidation

  def current_user
    validate_json_token && load_current_user
  end

  def current_admin
    validate_json_token && load_current_admin
  end


  private

  def load_current_user
    if payload[0]['phone_number']
      User.find_by(phone_number: payload[0]['phone_number'])
    elsif payload[0]['email']
      User.find_by(email: payload[0]['email'])
    else
      User.find(payload[0]['user_id'])
    end
  end

  def load_current_admin
    User.find_by(email: payload[0]['email'], is_admin: true)
  end
end
