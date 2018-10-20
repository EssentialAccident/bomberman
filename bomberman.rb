# Gems
require 'gosu'

# Project files
require_relative 'lib/game_window'
require_relative 'lib/map'
require_relative 'lib/character'
require_relative 'lib/player'

# This just creates the window
class Bomberman
  def start
    @game_window = GameWindow.new 800, 600
    @game_window.show
  end
end

Bomberman.new.start
