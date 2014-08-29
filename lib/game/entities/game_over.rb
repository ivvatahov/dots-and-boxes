module Game
  module GameEntity
  	class GameOver < Core::Entity
      def initialize(game, winner)
        super game, 'gameover'
        @text = "GameOver"
        @winner = winner
        @new_game = false
        @vectors = [2, 2]
      end

      def update
        # @game.state = Game::GameState::OngoingState.new(@game) if @new_game
      end
    end
  end
end
