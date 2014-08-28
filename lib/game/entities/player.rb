module Game
  module GameEntity
    class Player < Core::Entity
      include Core::GameMath

      attr_reader :score
      attr_accessor :colour, :name, :succeed

      def initialize(game, name)
        super(game)
        @name = name
        @score = 0;
        @succeed = 0
      end

      def add_score(score)
        @score += score
      end

      def make_turn  
        edge = select_entity
        
        unless edge
          @succeed = 0 
          return
        end

        unless edge.drawn?
          edge.draw self
        end
      end

      def select_entity
        unless @game.input.empty?(:mouse_click)
          @game.entities.find do |entity|
            if entity.is_a? Edge
              mouse_click = Vector2f.new @game.input.input_map[:mouse_click][0], @game.input.input_map[:mouse_click][1]
              vectors = entity.vectors

              # Representing the edge like rectangle
              n = 0.10
              if vectors[0].y == vectors[1].y
                a = Vector2f.new vectors[0].x, vectors[0].y - n
                b = Vector2f.new vectors[1].x, vectors[1].y - n
                d = Vector2f.new vectors[0].x, vectors[0].y + n
              else
                a = Vector2f.new vectors[0].x - n, vectors[0].y
                b = Vector2f.new vectors[1].x - n, vectors[1].y
                d = Vector2f.new vectors[0].x + n, vectors[0].y
              end

              dot_in_rectangle? mouse_click, a, b, d
            end
          end
        end
      end
    end
  end
end
