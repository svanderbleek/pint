class AuthTokenJob
  def initialize(user_id, code)
    @job_data = {
      id: user_id,
      code: code
    }
  end

  def queue
    "queue:github:auth"
  end

  def to_json
    @job_data.to_json
  end
end
