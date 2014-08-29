module Game
  module GameState
    class EndState
      def initialize game
        @game = game
      end

      def game=(game)
        @game = game
        load_resources
      end

      def load_resources
        @game.clear_entities
        @game.add_entity GameOver.new @game 
      end
    end
  end
end
