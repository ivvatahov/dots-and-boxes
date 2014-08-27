module Game
  module GameState
    class StartState
      def initialize(game)
        @game = game
        load_resources
      end

      def game=(game)
        @game = game
      end

      def load_resources
        @game.add_entity WidthQuestion.new(@game)
        @game.add_entity HeightQuestion.new(@game)
        @game.add_entity StartGame.new(@game)
      end
    end
  end
end
