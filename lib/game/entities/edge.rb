module Game
  module GameEntity
    class Edge < Core::Entity
      include Core::GameMath

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
        @boxes.each do |box|
          if box.completed?
            player.succeed = 1
            box.owner = player
          else
            player.succeed = -1 if player.succeed != 1
          end
        end
      end

      def update
        @colour = "red" if drawn?
      end
    end
  end
end
