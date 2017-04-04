require_relative 'push_pull_base'

module ZmqRb
  class Puller < Base
    def initialize(*)
      super do |socket|
        socket.connect(endpoint)
      end
    end

    def retrieve
      loop { yield socket.recv }
    end

    private

    def mode
      :PULL
    end
  end
end
