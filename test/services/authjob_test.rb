require 'minitest/autorun'
require 'redis'
require 'uri'
require 'active_support'
require 'active_support/core_ext/object/to_json'
require './app/services/hopback'
require './app/services/hopback/auth_token_job'

class HopbackTest < MiniTest::Unit::TestCase
  def setup
    @auth_job = AuthTokenJob.new(1, 'code')
  end

  def test_is_queueable
    Hopback.enqueue(@auth_job)

    queued_job = JSON.parse(Hopback::QUEUE.lpop(@auth_job.queue))

    assert_equal('code', queued_job['code'])
    assert_equal(1, queued_job['id'])
  end
end
