# frozen_string_literal: true

module Bomberman
  # The class Sprite will handle the basic logic for all the sprites on the game
  class Sprite
    attr_reader :position, :width, :height

    def initialize(position, image, z_order = 0)
      @position = position
      @image = image
      @z_order = z_order
      if image.nil?
        @width = Tile::SIZE
        @height = Tile::SIZE
      else
        @width = @image.width
        @height = @image.height
      end
    end

    def draw(offset = Vector2D.zero)
      offset_position = @position.add_vector(offset)
      @image.draw offset_position.x, offset_position.y, @z_order
    end
  end
end
