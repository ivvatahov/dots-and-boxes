module Game
  module GameState
    class OngoingState
      def initialize(game)
        @game = game
        load_resources
      end

      def game=(game)
        @game = game
      end

      def load_resources
        @game.remove_all_entities
        @game.add_entity GameEntity::Grid.new(@game, 4, 4, "")
      end
    end
  end
end
