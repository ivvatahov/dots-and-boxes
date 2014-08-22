module Core
  class GameEngine
    def initialize(game, frames_per_second)
      @running = false
      @game = game
      @time = Time::GameTime.new
      @frame_time = Time::SECOND / frames_per_second
    end

    def start
      run unless @running
    end

    def stop
      @running = false
    end

    def run
      @running = true

      frames = 0;
      frame_counter = 0;

      last_time = @time.get_time
      unprocessed_time = 0

      while @running
        render_flag = false

        start_time = @time.get_time
        passed_time = start_time  -last_time
        last_time = start_time

        unprocessed_time += passed_time
        frame_counter += passed_time

        while unprocessed_time > @frame_time
          render_flag = true
          unprocessed_time -= @frame_time

          @game.process_input
          @game.update

          if frame_counter >= Time::SECOND
            p frames
            frames = 0
            frame_counter = 0
          end
        end

        if render_flag
          @game.rendering
          frames += 1
        else
          sleep(@frame_time)
        end
      end
    end

    private :run
  end
end
