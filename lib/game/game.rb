module Game
  class DotsAndBoxes < Core::BaseGame
    def initialize(input, render)
      super(input, render)
      @state = GameState::OngoingState.new self
    end

    def state=(state)
      @state = state
      @state.game = self
    end
    
    def rendering
      super
      render.draw_frame
    end
  end
end
