module Core
  class BaseGame
    attr_accessor :game_input

    def initialize(input, render)
      @input = input
      @game_render = render
      @entities = []
    end

    def add_entity(entity)
      @entities << entity
    end

    def clear_entities
      @entities = []
    end

    def process_input
      @input.catch_input
    end

    def update
      @entities.each { |entity| entity.update }
    end

    def rendering
      @entities.each { |entity| entity.rendering }
    end
  end
end