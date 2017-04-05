require_relative 'base'

module ZmqRb
  class Publisher < Base
    def initialize(*)
      super do |socket|
        socket.connect(endpoint)
      end
    end

    def retrieve
      loop { yield socket.recv }
    end

    def mode
      :PUB
    end
  end
end
