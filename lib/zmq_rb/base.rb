require 'zmq'

module ZmqRb
  class Base
    def initialize(endpoint:, topic:)
      @endpoint = endpoint
      @topic = topic

      setup
    end

    def stop
      ctx.destroy
    end

    private

    attr_reader :endpoint, :topic

    def setup
      socket.verbose = true
      yield socket if block_given
      socket.linger = 0
    end

    def mode
      raise unless super.in?(%i(PUSH PULL))

      super
    end

    def socket
      @socket ||= ctx.socket(mode)
    end

    def ctx
      @ctx ||= ZMQ::Context.new
    end
  end
end
