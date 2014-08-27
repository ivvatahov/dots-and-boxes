module RenderingEngine
  class GUIWindow < Fox::FXMainWindow
    include Fox

    def self.new_window(width: 400, height: 400)
      # Construct the application object
      app = FXApp.new("Dots And Boxes", "FXRuby")

      # Construct the main window
      main = GUIWindow.new(app, width, height)

      # Calling create() on the application recursively creates all of its
      # owned resources (e.g. the application's windows)
      app.create

      # Kick off the event loop
      app.run

      # Returning the main window
      main
    end

    def initialize(app, width, height)
      super(app, "Dots And Boxes", :opts => DECOR_ALL, :width => width, :height => height)

      @mouse_click = []

      # Set up the canvas
      @canvas = FXCanvas.new(self, :opts => LAYOUT_FILL_X | LAYOUT_FILL_Y)

      # Set up the back buffer
      @back_buffer = FXImage.new(app, nil, IMAGE_KEEP)

      # Handle resize events
      @canvas.connect(SEL_CONFIGURE) { |sender, sel, evt|
        @back_buffer.create unless @back_buffer.created?
        @back_buffer.resize(sender.width, sender.height)
        @ball.setWorldSize(sender.width, sender.height)
      }

      # Handle mouse click
      @canvas.connect(SEL_LEFTBUTTONPRESS) do |sender, sel, event|
        @mouse_click = [event.win_x, event.win_y]
      end
    end

    # Get the mouse clicks
    def catch_input
      @mouse_click
    end

    def device_context
      FXDCWindow.new(@back_buffer)
    end

    def draw_frame
      FXDCWindow.new(@canvas) { |dc| dc.drawImage(@back_buffer, 0, 0) }
    end

    def create
      super

      # Create the image used as the back-buffer
      @back_buffer.create

      # Draw the initial scene into the back-buffer
      # drawScene(@back_buffer)

      #Show the main window
      show(PLACEMENT_SCREEN)

      #Starting the game
      Thread.new do
        render = GUIRender.new self
        input = Core::Input.new self

        game = Game::DotsAndBoxes.new input, render
        frames_per_second = 200

        engine = Core::GameEngine.new game, frames_per_second
        engine.start
      end
    end
  end
end
