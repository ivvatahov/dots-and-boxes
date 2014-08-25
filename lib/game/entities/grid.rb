module Game
  module GameEntity
    class Grid < Core::Entity
      attr_reader :rows, :cols, :vectors

      def initialize(game, rows, cols, vectors)
        super(game)
        @rows, @cols = rows, cols
        @boxes = add_boxes
      end

      def add_boxes
        boxes = []

        @cols.times do |x|
          @rows.times do |y|
            all_edges = Hash.new { |hash, key| hash[key] = [] }
            box = Box.new @game, "add position"
            add_edges box, all_edges, x, y
            boxes << box
          end
        end

        boxes
      end

      def add_edges(box, all_edges, *position)
        edges = {}
        x, y = position

        if all_edges.has_key? position
          all_edges[position].each { |a| edges[turn_around a[0]] = a[1] }
        end

        Box::DIRECTIONS.each do |dir, vector|
          unless edges.has_key? dir
            edges[dir] = Edge.new @game
            all_edges[[vector[0] + x, vector[1] + y]] << [dir ,edges[dir]]
          end
        end

        edges.each do |direction, edge|
          box[direction] = edge
        end
      end

      def turn_around(direction)
        :north if direction == :south
        :south if direction == :north
        :east if direction == :west
        :west if direction == :east
      end

      private :turn_around, :add_boxes, :add_edges
    end
  end
end
