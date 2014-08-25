module Core
  module Time
    SECOND = 1.0.freeze

    class GameTime
      def get_time
        Object::Time.new.to_f
      end
    end
  end
end
