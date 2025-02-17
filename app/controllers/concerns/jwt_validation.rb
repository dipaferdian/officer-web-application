module JwtValidation
  private

  def validate_json_token
    @validate_json_token ||= payload && JwtService.valid_payload?(payload[0])
  end

  def payload
    @payload ||= begin
      token = request.headers['Authorization'].to_s
      JwtService.decode token.split(' ').last
    end
  rescue StandardError
    nil
  end
end
