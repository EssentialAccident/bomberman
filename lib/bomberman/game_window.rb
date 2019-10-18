module Bomberman
  # This class will contain the main game loop
  class GameWindow < Gosu::Window
    include Gosu

    def initialize(width, height)
      super width, height, false
      self.caption = 'Bomberman'
      @map = Map.new
      @player = Player.new
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
      if @player.position.x > width / 2
        offset = Vector2D.new(-@player.position.x + width / 2, offset.y)
      end
      if offset.x < (@map.dimension - width) * -1
        offset = Vector2D.new(-@map.dimension + width, offset.y)
      end
      # Offseting the Y Coordinate
      if @player.position.y > height / 2
        offset = Vector2D.new(offset.x, -@player.position.y + height / 2)
      end
      if offset.y < (@map.dimension - height) * -1
        offset = Vector2D.new(offset.x, -@map.dimension + height)
      end
      offset
    end
  end
end
