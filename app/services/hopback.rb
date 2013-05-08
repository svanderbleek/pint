class Hopback
  def self.const_missing(name)
    if name == 'QUEUE'
      @@queue ||= connect_queue
    else
      super
    end
  end

  def self.connect_queue
    redis_uri = URI.parse(ENV["REDISTOGO_URL"])

    Redis.new(
      host: uri.host,
      port: uri.port,
      password: uri.password
    )
  end

  def self.enqueue(job)
    QUEUE.lpush(job.queue, job.to_json)
  end
end
