module Bomberman
  # Class player controls the player character
  class Player < Character
    def draw
      @color = Color::AQUA
      draw_quad_with_vectors
    end
  end
end
