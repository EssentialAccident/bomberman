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
      scr_pos = screen_position
      @image.draw scr_pos.x_coordinate,
                  scr_pos.y_coordinate,
                  @z_order
    end

    def screen_position
      @position * SPRITE_SIZE
    end
  end
end
