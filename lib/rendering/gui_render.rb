module RenderingEngine
  class GUIRender
    include Game::GameEntity

    def initialize(window)
      @window = window
    end

    # Draw the entity into this device context
    def draw(entity)
      if entity.is_a? Edge
        vectors = entity.vectors
        dc = @window.device_context
        if entity.drawn?
          dc.setForeground(entity.colour)
          dc.lineWidth = entity.line_width
          dc.drawLine(vectors[0].x*100, vectors[0].y*100, vectors[1].x*100, vectors[1].y*100)
          dc.setForeground("blue")
          dc.fillCircle(vectors[0].x*100, vectors[0].y*100, 7)
          dc.fillCircle(vectors[1].x*100, vectors[1].y*100, 7)
        else
          dc.setForeground("blue")
          dc.fillCircle(vectors[0].x*100, vectors[0].y*100, 7)
          dc.fillCircle(vectors[1].x*100, vectors[1].y*100, 7)
        end
        dc.end
      end

      if entity.is_a? Box
        if entity.completed?
          vectors = entity.vectors
          middle_vector = (vectors[0] * 100 + vectors[2] * 100) * 0.5

          dc = @window.device_context
          dc.font = @window.font

          dc.setForeground("red")
          dc.drawImageText(middle_vector.x, middle_vector.y, entity.owner.name)
          dc.end
        end
      end
    end

    def draw_frame
      @window.draw_frame
    end
  end
end
