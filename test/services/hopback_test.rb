require 'minitest/autorun'
require 'ostruct'
require 'redis'
require '../../app/services/hopback'

class HopbackTest < MiniTest::Unit::TestCase
  def setup
    @job = OpenStruct.new(queue: 'test', to_json: { test: 'test' }.to_json)
  end

  def test_connects_to_redis
    assert(Hopback::QUEUE)
  end

  def test_pushes_data_to_queue
    Hopback.enqueue(@job)

    assert(JSON.parse(Hopback::QUEUE.lpop('test')).test == 'test')
  end
end
