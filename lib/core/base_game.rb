module Core
  class BaseGame
    attr_reader :entities, :input, :render
    attr_reader :game_over

    def initialize(input, render)
      @input = input
      @render = render
      @entities = []
    end

    def add_entity(entity)
      @entities << entity
    end

    def remove_entity(entity)
      @entities.delete(entity)
    end

    def remove_all_entities
      @entities = []
    end

    def process_input
      @input.process_input
    end

    def select(type)
      @entities.select { |entity| entity.type == type }
    end

    def update
      @entities.each { |entity| entity.update }
    end

    def rendering
      @entities.each { |entity| entity.rendering }
    end
  end
end
