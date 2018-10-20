module Bomberman
  # The class Sprite will handle the basic logic for all the sprites on the game
  class Sprite
    SPRITE_SIZE = 64

    attr_reader :position

    def initialize(position, image, z_order = 0)
      @position = position
      @image = image
      @z_order = z_order
    end

    def draw
      @image.draw screen_position.x_coordinate,
                  screen_position.y_coordinate,
                  @z_order
    end

    def screen_position
      @postion * SPRITE_SIZE
    end
  end
end
