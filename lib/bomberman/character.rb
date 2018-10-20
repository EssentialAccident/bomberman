module Bomberman
  # This will be the parent class for the player and the enemies
  class Character
    include Gosu

    attr_reader :x, :y

    # The position x, y represents the position on the map grid
    def initialize(window, x = 1, y = 1, color = Color::WHITE)
      @window = window
      @x = x
      @y = y
      @color = color
      # TODO: Add the array of images for animation
    end

    def update; end

    def draw
      # Temporarily the hcaracter will be represnted by a quad.
      # The drawing of the quad assumes that the tiles are 64 pixels squared
      # TODO: Display animations
      screen_x = @x * 64
      screen_y = @y * 64
      draw_quad screen_x, screen_y, @color,
                screen_x + 64, screen_y, @color,
                screen_x, screen_y + 64, @color,
                screen_x + 64, screen_y + 64, @color,
                60
    end

    def move(side)
      case side
      when :left
        @x -= 1
      when :right
        @x += 1
      when :up
        @y -= 1
      when :down
        @y += 1
      end
      # TODO: Add the conditions to avoid character to go out of the window
    end
  end
end
