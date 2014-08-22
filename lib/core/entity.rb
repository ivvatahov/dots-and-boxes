module Core
  class Entity

    def initialize(game)
      @game = game
    end

    def update
      puts "This method should be implemented"
    end

    def render
      game.render.rendering self
    end
  end
end