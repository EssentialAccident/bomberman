module Bomberman
  # Class player controls the player character
  class Player < Character
    attr_reader :position

    def initialize
      position = Vector2D.new Tile::SIZE, Tile::SIZE
      # For now there is no image for the playerl.
      # This will change when the animation system takes over
      super position
      @speed = 5
      @color = Color::AQUA
      # TODO: Add the array of images for animation
    end

    def draw(offset = Vector2D.zero)
      draw_quad_with_vectors(offset)
    end
  end
end
