module Bomberman
  # This will be the parent class for the player and the enemies
  class Character < Sprite
    include Gosu

    # The position x, y represents the position on the map grid
    def initialize(window, position, image, z_order)
      super position, image, z_order
      @window = window
      @color = Color::WHITE
      @speed = 5
      # TODO: Add the array of images for animation
    end

    def update; end

    def draw
      draw_quad_with_vectors
    end

    def move(direction)
      case direction
      when :left
        @position.x_coordinate -= @speed
      when :right
        @position.x_coordinate += @speed
      when :up
        @position.y_coordinate -= @speed
      when :down
        @position.y_coordinate += @speed
      end
      # TODO: Add the conditions to avoid character to go out of the window
    end

    private

    # The draw_quad_with_vectors is a temporary method.
    # It is a place holder for the sprites that I need to produce
    def draw_quad_with_vectors
      draw_quad @position.x_coordinate, @position.y_coordinate, @color,
                @position.x_coordinate + 64, @position.y_coordinate, @color,
                @position.x_coordinate, @position.y_coordinate + 64, @color,
                @position.x_coordinate + 64, @position.y_coordinate + 64, @color,
                60
    end
  end
end
