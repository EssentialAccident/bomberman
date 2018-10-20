module Bomberman
  # This will be the parent class for the player and the enemies
  class Character
    include Gosu

    attr_reader :x, :y

    # The position x, y represents the position on the map grid
    def initialize(window, position = Vector2D.new(1, 1), color = Color::WHITE)
      @window = window
      @position = position
      @color = color
      # TODO: Add the array of images for animation
    end

    def update; end

    def draw
      # Temporarily the hcaracter will be represnted by a quad.
      # The drawing of the quad assumes that the tiles are 64 pixels squared
      # TODO: Display animations
      draw_quad_with_vectors @position * 64
    end

    def move(direction)
      case direction
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

    private

    def draw_quad_with_vectors(screen_position)
      screen_x = screen_position.x_coordinate
      screen_y = screen_position.y_coordinate
      draw_quad screen_x, screen_y, @color,
                screen_x + 64, screen_y, @color,
                screen_x, screen_y + 64, @color,
                screen_x + 64, screen_y + 64, @color,
                60
    end
  end
end
