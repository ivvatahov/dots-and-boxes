module Game
  class DotsAndBoxes < Core::BaseGame
    include GameState

    def initialize(input, render)
      super(input, render)
      @state = OngoingState.new self
    end

    def state=(state)
      @state = state
      @state.game = self
    end
  end
end
