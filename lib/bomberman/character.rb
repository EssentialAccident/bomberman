module Bomberman
  # This will be the parent class for the player and the enemies
  class Character < Sprite
    include Gosu

    # The position x, y represents the position on the map grid
    def initialize(window, position = Vector2D.new(1, 1), image, z_order)
      super position, image, z_order
      @window = window
      @color = Color::White
      # TODO: Add the array of images for animation
    end

    def update; end

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

    # The draw_quad_with_vectors is a temporary method.
    # It is a place holder for the sprites that I need to produce
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
