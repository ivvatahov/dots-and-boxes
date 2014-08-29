module Game
  class DotsAndBoxes < Core::BaseGame
    attr_writer :game_over
    def initialize(input, render)
      super(input, render)
      @state = GameState::OngoingState.new self
      @game_over = false
    end

    def state=(state)
      @state = state
      remove_all_entities
    end

    def update
      super
      if @game_over
        p "WInner: " + select("player").max_by(&:score).name
        @game_over = false
        @state = Game::GameState::OngoingState.new self
      end
    end

    def rendering
      super
      render.draw_frame
    end
  end
end
