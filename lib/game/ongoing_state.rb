module Game
  module GameState
    class OngoingState
      attr_writer :game
      
      def initialize(game)
        @game = game
        load_resources
      end

      def load_resources
        @game.remove_all_entities
        @game.add_entity GameEntity::Players.new @game, 2
        @game.add_entity GameEntity::Grid.new @game, 4, 4
      end
    end
  end
end
