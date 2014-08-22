module Game
  include Core
  
  class DotsAndBoxes < BaseGame
    def initialize(input, render)
      super(input, render)
      @state = StartState.new
      @state.game = self
    end

    def state=(state)
      @state = state
      @state.game = self
    end
  end
end