module Bomberman
  # This will be the parent class for the player and the enemies
  class Character < Sprite
    include Gosu

    DIRECTION = {
      left:   Vector2D.new(-1, 0),
      right:  Vector2D.new(1, 0),
      up:     Vector2D.new(0, -1),
      down:   Vector2D.new(0, 1)
    }.freeze

    # The position x, y represents the position on the map grid
    def initialize(position, image = nil, z_order = 15)
      super position, image, z_order
      @color = Color::WHITE
      @speed = 5
      # TODO: Add the array of images for animation
    end

    def update; end

    def draw
      if @image.nil?
        draw_quad_with_vectors
      else
        super
      end
    end

    def move(direction)
      @position = @position.add_vector(DIRECTION[direction].multiply_scalar(@speed))
      # TODO: Add the conditions to avoid character to go out of the window
    end

    private

    # The draw_quad_with_vectors is a temporary method.
    # It is a place holder for the sprites that I need to produce
    def draw_quad_with_vectors
      draw_quad @position.x, @position.y, @color,
                @position.x + 64, @position.y, @color,
                @position.x, @position.y + 64, @color,
                @position.x + 64, @position.y + 64, @color,
                60
    end
  end
end
