class Hopback
  def self.const_missing(name)
    if name == :QUEUE
      @@queue ||= connect_queue
    else
      super
    end
  end

  def self.connect_queue
    redis = URI.parse(ENV["REDISTOGO_URL"])

    Redis.new(
      host: redis.host,
      port: redis.port,
      password: redis.password
    )
  end

  def self.enqueue(job)
    puts job.to_json
    QUEUE.lpush(job.queue, job.to_json)
  end
end
