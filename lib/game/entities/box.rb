module Game
  module GameEntity
    class Box < Core::Entity
      include Core::GameMath
      
      DIRECTIONS = { :north => [-1, 0],
                     :south => [1, 0],
                     :east => [0, 1],
                     :west => [0, -1]
                     }.freeze

      attr_reader :edges, :owner, :vectors
      attr_accessor :position, :score_to_take, :text_colour

      def initialize(game, vectors = [], score_to_take = 10)
        super game, 'box'
        @edges = {}
        @score_to_take = score_to_take
        @vectors = vectors
      end

      def []=(direction, edge)
        @edges[direction] = edge
        edge.add_box self
        edge.vectors = edge_vectors direction
      end

      def edge_vectors(direction)
        case
        when direction == :north
          [ 
            Vector2f.new(@vectors[0].x, @vectors[0].y),
            Vector2f.new(@vectors[1].x, @vectors[1].y) 
          ]
        when direction == :east
          [ 
            Vector2f.new(@vectors[1].x, @vectors[1].y),
            Vector2f.new(@vectors[2].x, @vectors[2].y) 
          ]
        when direction == :south
          [ 
            Vector2f.new(@vectors[2].x, @vectors[2].y),
            Vector2f.new(@vectors[3].x, @vectors[3].y) 
          ]
        when direction == :west
          [ 
            Vector2f.new(@vectors[3].x, @vectors[3].y),
            Vector2f.new(@vectors[0].x, @vectors[0].y) 
          ]
        end
      end

      def draw_edge(dir)
        @edges[dir].draw
      end

      def completed?
        edges.values.all? { |edge| edge.drawn? }
      end

      def owner=(owner)
        raise BoxIncompleteError unless completed?
        raise BoxOwnerAlreadySetError if @owner
        @owner = owner
        @text_colour = owner.colour
        owner.add_score @score_to_take
      end

      class BoxIncompleteError < StandardError; end
      class BoxOwnerAlreadySetError < StandardError; end
    end
  end
end
