include Fox

module RenderingEngine
  class Window < FXMainWindow
    def self.new_window(game, input)
      FXApp.new("Dots And Boxes", "FXRuby") do |app|
        Window.new(app, render)
        app.create
        app.run
      end
    end

    def initialize(app, game, input)
      super(app, "Dots And Boxes", :opts => DECOR_ALL, :width => 400, :height => 300)

      @game = game
      @input = input
      @mouse_click = []

      # Set up the canvas
      @canvas = FXCanvas.new(self, :opts => LAYOUT_FILL_X | LAYOUT_FILL_Y)

      # Set up the back buffer
      @back_buffer = FXImage.new(app, nill, IMAGE_KEEP)

      # Handle expose events
      @canvas.connect(SEL_PAINT) do |sender, sel, evt|
        FXDCWindow.new(sender, evt) { |dc| dc.reawImage(@back_buffer, 0, 0) }
      end

      # Handle resize events
      @canvas.connect(SEL_CONFIGURE) do |sender, sel, evt|
        @back_buffer.create unless @back_buffer.created?
        @back_buffer.resize(sender.width, sender.height)
        # HERE
        drawWcene(@back_buffer)
      end

      # Handle mouse click
      @canvas.connect(SEL_LEFTBUTTONPRESS) do |sender, sel, event|
        @mouse_click = [event.win_x, event.win_y]
      end
    end

    # Draw the entity into this device context
    def draw(entity, dc)
      if entity.is_a? Edge
        dc.setForeground(entity.color)
        dc.lineStyle = LINE_ONOFF_DASH if entity.selected? && entity.drawn?
        dc.lineWidth = entity.line_width
        dc.drawLine(*entity.vectors)
      end
    end

    def create
      super

      # Create the image used as the back-buffer
      @back_buffer.create

      #Draw the initial scene into the back-buffer
      drawScene(@back_buffer)

      #Show the main window
      show(PLACEMENT_SCREEN)
    end
  end
end
