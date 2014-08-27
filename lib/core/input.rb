module Core
  class Input
    def initialize(device)
      @device = device
      @input_vector = []
    end

    def add_input
      @input_vector = device.catch_input
    end

    def catch_input 
      @input_vector
    end

    def clear_input
      @input_vector = []
    end
  end
end
