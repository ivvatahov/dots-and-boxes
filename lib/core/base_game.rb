module Core
  class BaseGame
    def initialize(input, render)
      @input = input
      @render = render
      @entities = []
    end

    def add_entity(entity)
      @entities << entity
    end

    def clear_entities
      @entities = []
    end

    def input
    end

    def update
      @entities.each { |entity| entity.update }
    end

    def render
      @entities.each { |entity| entity.render }
    end
  end
end