module Game
  module GameEntity
    class Players < Core::Entity
      def initialize(game, number_of_players)
        super(game)
        @players = []
        @players_turn = 0
        number_of_players.times do |i|
          @players << Player.new(@game, "p" + i.to_s)
        end
      end

      def update
        player = @players[@players_turn]
        player.make_turn
        
        if player.succeed == -1
          player.succeed = 0
          @players_turn = (@players_turn + 1) % @players.size
        end
      end
    end
  end
end
