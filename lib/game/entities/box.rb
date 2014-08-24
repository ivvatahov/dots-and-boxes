module Game
  module GameEntity
    class Box < Core::Entity
      attr_reader :edges, :owner, :vectors
      attr_accessor :position

      def initialize(game, vectors)
        super(game)
        @edges = Hash.new
      end

      def []=(direction, line)
        @edges[direction] = line
        
      end

      def draw_edge(dir)
        @edges[dir].draw
      end

      def owner=(owner)
        raise BoxIncompleteError unless completed?
        raise BoxOwnerAlreadySetError if @owner
        @owner = owner
      end

      class BoxIncompleteError < StandardError; end
      class BoxOwnerAlreadySetError < StandardError; end
    end
  end
end
