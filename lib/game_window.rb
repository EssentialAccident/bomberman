# frozen_string_literal: true

module Bomberman
  # This class will contain the main game loop
  class GameWindow < Gosu::Window
    include Gosu

    def initialize(width, height)
      super width, height, false
      self.caption = 'Bomberman'
      @map = Map.new
      @player = Player.new
      @title = Title.new width, 52
    end

    def update
      # Player movement
      # TODO: For the movement of the player a movement controller can be
      # implemented later. For now the movement of the player will be handle
      # at the window
      @player.move(:left) if button_down?(KB_LEFT) || button_down?(KB_A)
      @player.move(:right) if button_down?(KB_RIGHT) || button_down?(KB_D)
      @player.move(:up) if button_down?(KB_UP) || button_down?(KB_W)
      @player.move(:down) if button_down?(KB_DOWN) || button_down?(KB_S)
    end

    def draw
      @map.draw(offset)
      @player.draw(offset)
      @title.draw
    end

    def button_down(button)
      case button
      # Closing the game
      when KB_ESCAPE
        exit
      end
    end

    private

    # Calculates the offset of the camera to display the sprites on the window
    def offset
      # The player should be center on the screen when possible
      offset = Vector2D.zero
      # Offseting the X Coordinate
      horizontal_offset = @player.position.x - (width / 2)
      max_horizontal_offset = @map.dimension - width
      if horizontal_offset > 0
        offset = Vector2D.new(-horizontal_offset, offset.y)
      end
      if horizontal_offset > max_horizontal_offset
        offset = Vector2D.new(-max_horizontal_offset, offset.y)
      end
      # Offseting the Y Coordinate
      vertical_offset = @player.position.y - (height / 2) + @title.height
      max_vertical_offset = @map.dimension - height + @title.height
      offset = Vector2D.new(offset.x, -vertical_offset) if vertical_offset > 0
      if vertical_offset > max_vertical_offset
        offset = Vector2D.new(offset.x, -max_vertical_offset)
      end
      offset.add_vector(Vector2D.new(0, @title.height))
    end
  end
end
