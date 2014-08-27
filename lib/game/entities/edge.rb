module Game
  module GameEntity
    class Edge < Core::Entity
      attr_reader :boxes
      attr_accessor :vectors, :colour, :line_width

      def initialize(game, vectors = [], line_width = 5)
        super(game)
        @drawn = false
        @boxes = []
        @vectors = vectors
        @colour = "blue"
        @line_width = line_width
      end

      def add_box(box)
        boxes << box
      end

      def drawn?
        @drawn
      end

      def draw(player)
        @drawn = true
        @boxes.each { |box| box[0].owner = player if box[0].complete? }
      end

      def update
        mouse_click = @game.input.input_vector
        check?(mouse_click)
      end

      def check?(mouse_click)
        v = Core::Vector2f.new mouse_click[0], mouse_click[1]
        
      end
    end
  end
end
