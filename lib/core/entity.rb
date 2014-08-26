module Core
  class Entity

    def initialize(game)
      @game = game
      @game.add_entity self
    end

    def update; end

    def rendering
      @game.render.draw self
    end
  end
end
