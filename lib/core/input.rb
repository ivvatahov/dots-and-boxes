module Core
  class Input
    def initialize(device)
      @device = device
      @input_map = Hash.new { |hash, key| hash[key] = [] }
    end

    def process_input
      @input_map = @device.catch_input
    end

    def input_map
      @input_map.clone
    end

    def clear_input
      @input_map = Hash.new { |hash, key| hash[key] = [] }
    end

    def empty?(object)
      @input_map[object].empty?
    end
  end
end
