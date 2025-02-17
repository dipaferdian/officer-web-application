# frozen_string_literal: true

module RequestHelpers

  RSpec.configure do |config|
    config.include RequestHelpers
  end

  def header(user)
    if user.email
      { 'Authorization' => ::JwtService.encode(email: user.email) }
    end
  end

  def parsed_json_body
    JSON.parse(response.body)
  end
end
