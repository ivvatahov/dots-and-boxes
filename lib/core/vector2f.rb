module Core
  module GameMath
    class Vector2f
      attr_accessor :x, :y

      def initialize(x, y)
        @x, @y = x, y
      end

      def length
        Math.sqrt(@x * @x + @y * @y)
      end

      def +(other)
        Vector2f.new @x + other.x, @y + other.y
      end

      def -(other)
        Vector2f.new @x - other.x, @y - other.y
      end

      def *(other)
        if other.is_a? Numeric
          Vector2f.new @x * other, @y * other
        elsif other.is_a? Vector2f
          @x * other.x + @y * other.y
        end
      end
    end
  end
end
