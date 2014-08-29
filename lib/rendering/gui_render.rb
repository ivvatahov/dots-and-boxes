module RenderingEngine
  class GUIRender
    include Game::GameEntity

    def initialize(window)
      @window = window
    end

    # Draw the entity into this device context
    def draw(entity)
      case entity
      when Edge then draw_edge entity
      when Box then draw_box entity
      end
    end

    def draw_box(box)
      if box.completed?
        a = box.vectors[0] * 100
        b = box.vectors[2] * 100
        middle_vector = (a + b) * 0.5

        dc = @window.device_context
        dc.font = @window.font
        dc.setForeground("red")
        dc.drawImageText(middle_vector.x, middle_vector.y, box.owner.name)
        dc.end
      end
    end

    def draw_edge(edge)
      a = edge.vectors[0] * 100
      b = edge.vectors[1] * 100

      dc = @window.device_context
      dc.setForeground(edge.colour)
      dc.lineWidth = edge.line_width
      dc.drawLine(a.x, a.y, b.x, b.y)
      dc.setForeground("blue")
      dc.fillCircle(a.x, a.y, 7)
      dc.fillCircle(b.x, b.y, 7)
      dc.end
    end

    def draw_frame
      @window.draw_frame
    end
  end
end
