require 'zmq'

module ZmqRb
  class Base
    def initialize(endpoint:, topic: nil)
      @endpoint = endpoint
      @topic = topic

      setup
    end

    def stop
      ctx.destroy
    end

    def mode
      raise NotImplementedError
    end

    private

    attr_reader :endpoint, :topic

    def setup
      # socket.verbose = true
      yield socket if block_given?
      socket.linger = 0
    end

    def socket
      @socket ||= ctx.socket(mode)
    end

    def ctx
      @ctx ||= ZMQ::Context.new
    end
  end
end
