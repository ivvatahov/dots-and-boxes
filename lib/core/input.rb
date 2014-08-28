module Core
  class Input
    attr_reader :input_map

    def initialize(device)
      @device = device
      @input_map = {}
    end

    def process_input
      @input_map = @device.catch_input
    end

    def clear_input
      @input_map = {}
    end

    def empty?(object)
      @input_map[object].empty?
    end
  end
end
