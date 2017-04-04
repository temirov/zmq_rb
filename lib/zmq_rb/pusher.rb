require_relative 'push_pull_base'

module ZmqRb
  class Pusher < Base
    def initialize(*)
      super do |socket|
        socket.bind(endpoint)
      end
    end

    def submit(payload)
      socket.send(payload)
    end

    private

    def mode
      :PUSH
    end
  end
end
