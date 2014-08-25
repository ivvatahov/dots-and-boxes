module Game
  module GameEntity
    class Box < Core::Entity
      DIRECTIONS = { :north => [-1, 0],
                     :south => [1, 0],
                     :east => [0, 1],
                     :west => [0, -1]
                     }.freeze

      attr_reader :edges, :owner, :vectors
      attr_accessor :position, :score_to_take

      def initialize(game, vectors, score_to_take = 10)
        super(game)
        @edges = {}
        @score_to_take = score_to_take
      end

      def []=(direction, edge)
        @edges[direction] = edge
        edge.add_box self
      end

      def draw_edge(dir)
        @edges[dir].draw
      end

      def owner=(owner)
        raise BoxIncompleteError unless completed?
        raise BoxOwnerAlreadySetError if @owner
        @owner = owner
        owner.add_score @score_to_take
      end

      class BoxIncompleteError < StandardError; end
      class BoxOwnerAlreadySetError < StandardError; end
    end
  end
end
