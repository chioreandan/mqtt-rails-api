class JsonWebToken
  def self.encode(payload)
    return JWT.encode(payload, 'my$ecretK3y')
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.secrets.secret_key_base)[0])
  rescue
    nil
  end
end
