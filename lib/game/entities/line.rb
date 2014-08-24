module Game
  module GameEntity
    class Line < Core::Entity
      attr_reader:drawn
      attr_accessor :vectors

      def initialize(game, vectors = [])
        super(game)
        @drawn = false
        @vectors = vectors
      end

      def drawn?
        @drawn
      end

      def draw
        @drawn = true
      end
    end
  end
end
