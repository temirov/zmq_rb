require 'zmq'
ctx = ZMQ::Context.new
endpoint = 'tcp://127.0.0.1:5555'
push = ctx.bind(:PUSH, endpoint)
push.send 'Hi'

require 'zmq'
ctx = ZMQ::Context.new
endpoint = 'tcp://127.0.0.1:5555'
pull = ctx.connect(:PULL, endpoint)
pull.recv
# pull.close

require 'zmq'
endpoint = 'tcp://127.0.0.1:5555'
ctx = ZMQ::Context.new
push = ctx.bind(:PUSH, endpoint)
threads = []
5.times do
  threads << Thread.new do
    pull = ctx.connect(:PULL, endpoint)
    msg = pull.recv
    pull.close
    msg
  end
end

redis.subscribe('test') do |on|
  on.message do |channel, msg|
    puts "##{channel} - #{msg}"
  end
end

require_relative 'lib/pub_sub'
endpoint = 'tcp://127.0.0.1:5555'
topic = 'raw_insight'
producer = Producer.new(endpoint: endpoint, topic: topic)
producer.submit('Hi')

require_relative 'lib/pub_sub'
endpoint = 'tcp://127.0.0.1:5555'
topic = 'raw_insight'
consumer = Consumer.new(endpoint: endpoint, topic: topic)
consumer.subscribe
consumer.call { |p| puts p }
