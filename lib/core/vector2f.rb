module Core
  class Vector2f
    attr_accessor :x, :y

    def initialize(x, y)
      @x, @y = x, y
    end

    def length
      Math.sqrt(@x * @x + @y * @y)
    end
  end
end