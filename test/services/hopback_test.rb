require 'minitest/autorun'
require 'ostruct'
require 'redis'
require 'uri'
require 'active_support'
require 'active_support/core_ext/object/to_json'
require './app/services/hopback'

Job = Struct.new(:queue, :data) do
  def to_json
    data.to_json
  end
end

class HopbackTest < MiniTest::Unit::TestCase
  def setup
    @job = Job.new('test', { test: 'test' })
  end

  def test_connects_to_redis
    assert(Hopback::QUEUE)
  end

  def test_pushes_data_to_queue
    Hopback.enqueue(@job)

    assert_equal('test', JSON.parse(Hopback::QUEUE.lpop('test'))['test'])
  end
end
