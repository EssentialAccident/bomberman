module Bomberman
  # Class player controls the player character
  class Player < Character
    def initialize(window, position, image, z_order)
      super window, position * SPRITE_SIZE, image, z_order
      @window = window
      @color = Color::WHITE
      @speed = 5
      # TODO: Add the array of images for animation
    end

    def draw
      @color = Color::AQUA
      draw_quad_with_vectors
    end
  end
end
