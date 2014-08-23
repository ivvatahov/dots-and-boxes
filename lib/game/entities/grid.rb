module Game
  module GameEntity
    class Grid < Entity
      attr_reader :rows, :cols, :vectors

      def initialize(rows, cols, vectors)
        @rows, @cols = rows, cols
        @data = Set[]
        @cols.times do |x|
          @rows.times do |y|
            @data << Box.new(x, y)
          end
        end
      end
    end
  end 
end