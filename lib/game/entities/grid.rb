module Game
  module GameEntity
    class Grid < Core::Entity
      include Core::GameMath
      
      attr_reader :rows, :cols, :vectors

      def initialize(game, rows, cols)
        super(game)
        @rows, @cols = rows, cols
        @boxes = add_boxes
      end

      def add_boxes
        boxes = []
        all_edges = Hash.new { |hash, key| hash[key] = [] }

        @cols.times do |x|
          @rows.times do |y|
            box = Box.new @game, box_vectors(x + 1, y + 1)
            add_edges box, all_edges, x, y
            boxes << box
          end
        end
        boxes
      end

      def box_vectors(x, y)
        [ Vector2f.new(x, y),
          Vector2f.new(x, y + 1),
          Vector2f.new(x + 1, y + 1),
          Vector2f.new(x + 1, y) ]
      end

      def add_edges(box, all_edges, *position)
        edges = {}
        x, y = position

        if all_edges.has_key? position
          all_edges[position].each { |a| edges[turn_around a[0]] = a[1] }
        end

        Box::DIRECTIONS.each do |dir, vector|
          unless edges.has_key? dir
            edge = Edge.new @game
            edges[dir] = edge
            all_edges[[vector[0] + x, vector[1] + y]] << [dir ,edge]
          end
        end

        edges.each do |direction, edge|
          box[direction] = edge
        end
      end

      def turn_around(direction)
       return :north if direction == :south
       return :south if direction == :north
       return :east if direction == :west
       return :west if direction == :east
      end

      private :turn_around, :add_boxes, :add_edges
    end
  end
end
