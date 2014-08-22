module Core
  class Input
    def initialize
      @input_vector = []
    end

    def add_input(input_element)
      @input_vector << input_element
    end

    def catch_input
      puts "This method should be initialized"
    end
  end
end