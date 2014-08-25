module Game
  module GameEntity
    class Players < Core::Entity
      def initialize(game, number_of_players)
        super(game)
        @players = []
        @players_turn = 0
        number_of_players.times do |i|
          @players << Player.new(game, "player" + i.to_s)
        end
      end

      def update
        @players[i].make_turn
      end
    end
  end
end
