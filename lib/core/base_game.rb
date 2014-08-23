module Core
  class BaseGame
    attr_accessor :input, :render 

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