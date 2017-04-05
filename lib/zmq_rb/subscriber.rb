require_relative 'base'

module ZmqRb
  class Subscriber < Base
    def initialize(*)
      super do |socket|
        socket.connect(endpoint)
      end
    end

    def retrieve
      loop { yield socket.recv }
    end

    def mode
      :SUB
    end
  end
end
