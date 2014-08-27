module Core
  class Input
    attr_reader :input_vector

    def initialize(device)
      @device = device
      @input_vector = []
    end

    def process_input
      @input_vector = @device.catch_input
    end

    def clear_input
      @input_vector = []
    end
  end
end
