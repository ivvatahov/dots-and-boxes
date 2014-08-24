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
        all_lines = Hash.new
        lines = Hash.new
        directions = { :north => [-1, 0],
                       :south => [1, 0],
                       :east => [0, 1],
                       :west => [0, -1] }

        @cols.times do |x|
          @rows.times do |y|
            box = Box.new @game, [x, y]

            lines.clear
            position = [x, y]

            if all_lines.has_key? position
              all_lines[position].each do |direction, line|
                lines[turn_around direction] = line
              end
            end

            directions.each do |key, value|
              unless lines.has_key? key
                lines[key] = Line.new @game
                dir = directions[key]
                all_lines[[dir[0] + x, dir[1] + y]] = [key ,lines[key]];
              end
            end

            lines.each { |direction, line| box[directions] = line }
            boxes << box
          end
        end
        boxes
      end

      def turn_around(direction)
        :north if direction == :south
        :south if direction == :north
        :east if direction == :west
        :west if direction == :east
      end
      
      private :turn_around, :add_boxes
    end
  end
end
