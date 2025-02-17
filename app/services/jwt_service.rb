class JwtService
  SECRET_KEY = Rails.application.credentials.dig(:secret_key_base) || 'TEMP_SECRET_KEY'

  def self.encode(data)
    JWT.encode(data.merge(meta), SECRET_KEY, 'HS256')
  end

  def self.decode(token)
    JWT.decode(token, SECRET_KEY, algorithm: 'HS256')
  end

  def self.valid_payload?(payload)
    if payload['iss'] == meta[:iss] && payload['aud'] == meta[:aud]
      true
    else
      false
    end
  end

  def self.meta
    {
      iss: 'police-api',
      aud: 'client'
    }
  end
end