module Core
  class Entity
    attr_reader :type

    def initialize(game, type = '')
      @game = game
      @type = type
      @game.add_entity self
    end

    def update; end

    def rendering
      @game.render.draw self
    end
  end
end
