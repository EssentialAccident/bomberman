module Bomberman
  # The class Sprite will handle the basic logic for all the sprites on the game
  class Sprite
    attr_reader :position

    def initialize(position, image, z_order = 0)
      @position = position
      @image = image
      @z_order = z_order
    end

    def draw
      @image.draw @position.x, @position.y, @z_order
    end
  end
end
