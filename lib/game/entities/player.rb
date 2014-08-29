module Game
  module GameEntity
    class Player < Core::Entity
      include Core::GameMath

      attr_reader :score
      attr_accessor :colour, :name, :succeed

      def initialize(game, name)
        super game, 'player'
        @name = name
        @score = 0;
        @succeed = 0
      end

      def add_score(score)
        @score += score
      end

      def make_turn
        if edge = select_entity
          @succeed = 0
          edge.draw self unless edge.drawn?
        end
      end

      def select_entity
        unless @game.input.empty?(:mouse_click)
          @game.entities.find do |entity|
            if entity.is_a? Edge
              input = @game.input.input_map[:mouse_click]
              mouse_click = Vector2f.new input[0], input[1]
              entity.dot_near_edge? mouse_click
            end
          end
        end
      end
    end
  end
end
