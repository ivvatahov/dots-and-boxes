module Game
  module GameEntity
    class Player << Core::Entity
      attr_reader :score

      def initialize(game, name)
        super(game)
        @name = name
        @score = 0;
      end

      def make_turn
        edge = @game.input.get_edge
        unless edge.drawn?
          edge.draw self
        end
      end

      def add_score(score)
        @score += score
      end
    end
  end
end
