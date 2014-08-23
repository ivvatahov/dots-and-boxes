module Game
  module GameEntity
    include Core

    class Dot < Entity
      def initialize(vector)
        @dot = vector
      end
    end
  end
end
