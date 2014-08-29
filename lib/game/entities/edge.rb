module Game
  module GameEntity
    class Edge < Core::Entity
      include Core::GameMath

      attr_reader :boxes
      attr_accessor :vectors, :colour, :line_width

      def initialize(game, vectors = [], line_width = 5)
        super(game)
        @drawn = false
        @selected = false
        @boxes = []
        @vectors = vectors
        @colour = "white"
        @line_width = line_width
      end

      def add_box(box)
        boxes << box
      end

      def drawn?
        @drawn
      end

      def selected?
        @selected
      end

      def draw(player)
        @drawn = true
        @colour = "red"
        @boxes.each do |box|
          if box.completed?
            player.succeed = 1
            box.owner = player
          else
            player.succeed = -1 if player.succeed != 1
          end
        end
      end

      def dot_near_edge?(dot)
        # Representing the edge like rectangle
        n = 0.10
        if @vectors[0].y == @vectors[1].y
          a = Vector2f.new @vectors[0].x, @vectors[0].y - n
          b = Vector2f.new @vectors[1].x, @vectors[1].y - n
          d = Vector2f.new @vectors[0].x, @vectors[0].y + n
        else
          a = Vector2f.new @vectors[0].x - n, @vectors[0].y
          b = Vector2f.new @vectors[1].x - n, @vectors[1].y
          d = Vector2f.new @vectors[0].x + n, @vectors[0].y
        end
        dot_in_rectangle? dot, a, b, d
      end
    end
  end
end
