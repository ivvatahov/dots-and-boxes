module Game
  module GameState
    class OngoingState
      def initialize(game)
        @game = game
      end

      def game=(game)
        @game = game
        load_resources
      end

      def load_resources
        @game.clear_entities
        @game.add_entity Board.new(@game)
        @game.add_entity Square.new(@game)
        @game.add_entity Line.new(@game)
        @game.add_entity Dot.new(@game)
        @game.add_entity Player.new(@game)
        @game.add_entity Player.new(@game)
      end
    end
  end
end