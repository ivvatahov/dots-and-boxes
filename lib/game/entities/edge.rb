module Game
  module GameEntity
    class Edge < Core::Entity
      attr_reader :boxes
      attr_accessor :vectors

      def initialize(game, vectors = [])
        super(game)
        @drawn = false
        @boxes = []
        @vectors = vectors
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
    end
  end
end
