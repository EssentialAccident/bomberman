# The module Bomberman contains all the requirements for the Bomberman Game
module Bomberman
  # Gems
  require 'gosu'

  # Project files
  require_relative 'lib/bomberman/game_window'
  require_relative 'lib/bomberman/map'
  require_relative 'lib/bomberman/sprite'
  require_relative 'lib/bomberman/character'
  require_relative 'lib/bomberman/player'

  # Utility files
  require_relative 'lib/math/Vector2D'

  # This just creates the window
  class Bomberman
    def start
      @game_window = GameWindow.new 800, 600
      @game_window.show
    end
  end

  Bomberman.new.start
end
