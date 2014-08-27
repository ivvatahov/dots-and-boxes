module RenderingEngine
  class GUIRender
    def initialize(window)
      @window = window
    end

    # Draw the entity into this device context
    def draw(entity)
      if entity.is_a? Game::GameEntity::Edge
        vectors = entity.vectors
        dc = @window.device_context
        dc.setForeground("red")
        dc.lineWidth = 5
        dc.drawLine(120, 45, 7, 8)
        dc.end
      end
    end

    def draw_frame
      @window.draw_frame
    end
  end
end
