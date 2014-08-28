require "./vector2f"

module Core
  module GameMath
    def dot_in_rectangle?(dot, a, b, d)
      x = (a - dot) * (a - b)
      y = (a - b) * (a - b)
      z = (a - dot) * (a - d)
      p = (a - d) * (a - d)

      0 < x && x < y && 0 < z && z < p
    end
  end
end
