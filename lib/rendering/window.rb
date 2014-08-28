module RenderingEngine
  class GUIWindow < Fox::FXMainWindow
    include Fox

    def self.new_window(width: 800, height: 600)
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

    attr_reader :font

    def initialize(app, width, height)
      super(app, "Dots And Boxes", :opts => DECOR_TITLE | DECOR_MINIMIZE | DECOR_CLOSE , :width => width, :height => height)

      @mouse_click = []

      # Create the font
      @font = FXFont.new(getApp(), "times", 10, FONTWEIGHT_BOLD | FONTENCODING_CELTIC)

      # Set up the canvas
      @canvas = FXCanvas.new(self, :opts => LAYOUT_FILL_X | LAYOUT_FILL_Y)

      # Set up the back buffer
      @back_buffer = FXImage.new(app, nil, IMAGE_KEEP)


      # Creating the game
      render = GUIRender.new self
      input = Core::Input.new self

      game = Game::DotsAndBoxes.new input, render
      frames_per_second = 400

      @engine = Core::GameEngine.new game, frames_per_second

      # Handle resize events
      @canvas.connect(SEL_CONFIGURE) { |sender, sel, evt|
        @back_buffer.create unless @back_buffer.created?
        @back_buffer.resize(sender.width, sender.height)
      }

      # Handle mouse click
      @canvas.connect(SEL_LEFTBUTTONPRESS) do |sender, sel, event|
        @mouse_click = [event.win_x / 100.0, event.win_y / 100.0]
      end

      # Handle closw window
      connect(SEL_CLOSE) { |sender, sel, event| @engine.stop }
    end

    # Get the mouse clicks
    def catch_input
      mc = @mouse_click
      @mouse_click = []
      { :mouse_click => mc, :cursor_position => cursorPosition.first(2) }
    end

    def device_context
      FXDCWindow.new(@back_buffer)
    end

    def draw_frame
      FXDCWindow.new(@canvas) { |dc| dc.drawImage(@back_buffer, 0, 0) }
      FXDCWindow.new(@back_buffer) do |dc|
        dc.setForeground(FXRGB(255, 255, 255))
        dc.fillRectangle(0, 0, @canvas.width, @canvas.height)
      end
    end

    def create
      super

      # Create the font
      @font.create

      # Create the image used as the back-buffer
      @back_buffer.create

      # Draw the initial scene into the back-buffer
      # drawScene(@back_buffer)

      #Show the main window
      show(PLACEMENT_SCREEN)

      #Starting the game
      Thread.new do
        @engine.start
      end
    end
  end
end
