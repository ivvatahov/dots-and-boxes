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
        dc.setForeground(entity.colour)
        dc.lineWidth = entity.line_width
        dc.drawLine(vectors[0].x*100, vectors[0].y*100, vectors[1].x*100, vectors[1].y*100)
        dc.end
      end
    end

    def draw_frame
      @window.draw_frame
    end
  end
end
